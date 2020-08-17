class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable, :confirmable,
         :recoverable, :rememberable, :validatable

  has_many :orders, dependent: :destroy
  has_many :images, dependent: :destroy

  def email_username
    self.email.split('@').first
  end
end
