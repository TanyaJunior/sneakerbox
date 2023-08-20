module ApplicationHelper
  def cart_count
    current_user.cart.cart_items.sum(:quantity) if current_user&.cart
  end
end
