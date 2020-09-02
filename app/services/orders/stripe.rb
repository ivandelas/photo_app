class Orders::Stripe
  INVALID_STRIPE_OPERATION = 'Invalid Stripe Operation'

  def self.execute(order:, user:)
    begin
      product = order.product
      # check if the order is a plan
      if product.stripe_plan_name.blank?
        charge = self.execute_charge(
          price_cents: product.price_cents,
          description: product.name,
          card_token: order.token
        )
      else
        # subscription will be handled here
      end

      unless charge&.id.blank?
        # if there is a charge with id, set the order to be paid
        order.charge_id = charge.id
        order.set_paid
      end
    rescue Stripe::StripeError => e
      # if a stripe error is raised from the API, set the status to be failed and an error message
      order.error_message = INVALID_STRIPE_OPERATION
      order.set_failed
    end
  end

  private

  def self.execute_charge(price_cents:, description:, card_token:)
    Stripe::Charge.create({
      amount: price_cents.to_s,
      currency: 'usd',
      description: description,
      source: card_token
    })
  end
end