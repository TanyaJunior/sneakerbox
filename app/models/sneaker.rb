class Sneaker < ApplicationRecord
  belongs_to :user
  has_many :offers, dependent: :destroy
  has_one_attached :photo
  has_many :cart_items
  belongs_to :category


  enum status: { available: 0, sold: 1 }
  attribute :title, :string
  attribute :model, :string
  attribute :description, :text
  attribute :price, :integer
  
end
