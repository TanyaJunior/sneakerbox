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

  def destroy
    @cart_item = current_user.cart.cart_items.find(params[:id])
    @cart_item.destroy
    redirect_to cart_path, notice: "Sneaker removed from cart."
  end
end
