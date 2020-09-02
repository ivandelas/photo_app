# frozen_string_literal: true

class Users::RegistrationsController < Devise::RegistrationsController
  # before_action :configure_sign_up_params, only: [:create]
  # before_action :configure_account_update_params, only: [:update]

  # GET /resource/sign_up
  def new
    @product = Product.find(params[:product_id])
    super
  end

  # POST /resource
  def create
    build_resource(sign_up_params)
    @product = Product.find(order_params[:product_id])

    resource.save
    yield resource if block_given?

    if resource.persisted?
      @order = Order.new(token: order_params[:token])
      @order.user = resource
      @order.product = @product
      @order.price_cents = @product.price_cents
      Orders::Stripe.execute(order: @order, user: resource)

      if @order&.save
        if @order.paid?
          # append success message to the flash
          flash[:notice] = 'Subscription successful.'
        elsif @order.failed? && !@order.error_message.blank?
          # render error only if order failed and there is an error message
          flash.now.alert = @order.error_message
          resource.destroy
          build_resource(sign_up_params)
          clean_up_passwords resource
          set_minimum_password_length
          respond_with resource
        end
      else
        # if the order could not be saved
        flash.now.alert = 'Error saving your order.'
        resource.destroy
        build_resource(sign_up_params)
        clean_up_passwords resource
        set_minimum_password_length
        respond_with resource
      end

      if resource.active_for_authentication?
        set_flash_message! :notice, :signed_up
        sign_up(resource_name, resource)
        respond_with resource, location: after_sign_up_path_for(resource)
      else
        set_flash_message! :notice, :"signed_up_but_#{resource.inactive_message}"
        expire_data_after_sign_in!
        respond_with resource, location: after_inactive_sign_up_path_for(resource)
      end
    else
      clean_up_passwords resource
      set_minimum_password_length
      respond_with resource
    end
  end

  # GET /resource/edit
  # def edit
  #   super
  # end

  # PUT /resource
  # def update
  #   super
  # end

  # DELETE /resource
  # def destroy
  #   super
  # end

  # GET /resource/cancel
  # Forces the session data which is usually expired after sign
  # in to be expired now. This is useful if the user wants to
  # cancel oauth signing in/up in the middle of the process,
  # removing all OAuth session data.
  # def cancel
  #   super
  # end

  # protected

  # If you have extra params to permit, append them to the sanitizer.
  # def configure_sign_up_params
  #   devise_parameter_sanitizer.permit(:sign_up, keys: [:attribute])
  # end

  # If you have extra params to permit, append them to the sanitizer.
  # def configure_account_update_params
  #   devise_parameter_sanitizer.permit(:account_update, keys: [:attribute])
  # end

  # The path used after sign up.
  # def after_sign_up_path_for(resource)
  #   super(resource)
  # end

  # The path used after sign up for inactive accounts.
  # def after_inactive_sign_up_path_for(resource)
  #   super(resource)
  # end

  private

  def order_params
    params.require(:orders).permit(:product_id, :token)
  end
end
