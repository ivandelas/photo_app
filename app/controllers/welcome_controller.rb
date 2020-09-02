class WelcomeController < ApplicationController
  skip_before_action :authenticate_user!, only: :index

  def index
    @premium = Product.find_by(name: 'Premium')
    @amaze = Product.find_by(name: 'Amaze')

    if user_signed_in?
      @images = Image.all
    end
  end
end
