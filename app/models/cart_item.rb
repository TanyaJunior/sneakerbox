class CartItem < ApplicationRecord
  belongs_to :cart
  belongs_to :sneaker
end
