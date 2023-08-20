class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  has_many :sneakers, dependent: :destroy
  has_many :offers, dependent: :destroy
  has_one :cart
  has_one :profile
  after_create :create_user_profile

  def get_cart
    cart || create_cart
  end

  private

  def create_user_profile
    Profile.create(user: self)
  end

  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
end
