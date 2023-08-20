# app/controllers/carts_controller.rb
class CartsController < ApplicationController
  def show
    @cart_items = current_user.cart.cart_items.includes(:sneaker)
  end
end

# app/controllers/cart_items_controller.rb
class CartItemsController < ApplicationController
  def create
    sneaker = Sneaker.find(params[:sneaker_id])
    cart_item = current_user.cart.cart_items.build(sneaker: sneaker, quantity: 1)
    if cart_item.save
      redirect_to cart_path, notice: "Sneaker added to cart."
    else
      redirect_back fallback_location: root_path, alert: "Unable to add sneaker to cart."
    end
  end
end
