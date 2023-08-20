class SneakersController < ApplicationController
  def index
    @sneakers = Sneaker.left_outer_joins(:offers).where(offers: { id: nil })
    @sneakers = Sneaker.all
    @sneakers = Sneaker.includes(:category) # Make sure you include the associated category
    @sneakers_by_brand = Sneaker.all.group_by(&:brand)

  end

  def show
    @sneaker = Sneaker.find(params[:id])
    @offer = Offer.new
  end

  def edit
    @sneaker = Sneaker.find(params[:id])
  end

  def create
    @sneaker = Sneaker.new(sneaker_params)
    @sneaker.user = current_user
    if @sneaker.save
      redirect_to sneaker_path(@sneaker)
    else
      render "new"
    end
  end

  def new
    @sneaker = Sneaker.new
  end

  def update
    @sneaker = Sneaker.find(params[:id])

    if @sneaker.update(sneaker_params)
      redirect_to @sneaker, notice: 'Sneaker was successfully updated.'
    else
      Rails.logger.info("Update failed with errors: #{sneaker_params.inspect}")
      render :edit
    end
  end


  def add_to_cart
    @sneaker = Sneaker.find(params[:id])
    @cart = current_user.get_cart
    @cart_item = @cart.cart_items.find_or_initialize_by(sneaker: @sneaker)
    @cart_item.increment(:quantity)
    @cart_item.save

    respond_to do |format|
      format.html { redirect_to @sneaker, notice: 'Sneaker added to cart.' }
      format.js   # This will render add_to_cart.js.erb
    end
  end

  def set_cart
    @cart = current_user.cart || current_user.create_cart
  end

  def brand
    brand_name = params[:brand_name]
    @sneakers = Sneaker.where(brand: brand_name)
  end

  def magazine

  end

  def destroy
    @sneaker = Sneaker.find(params[:id])
    @sneaker.destroy
    redirect_to sneakers_path, notice: 'Sneaker was successfully deleted.'
  end

  def sales
    @sneakers_on_sale = Sneaker.where('price < ?', 2500)
  end


  private

  def my_sneakers
    @owned_sneakers_pending = current_user.sneakers.includes(:offers).where(offers: { id: nil })
    @accepted_sneakers = Sneaker.joins(:offers).where(offers: { status: 'accepted', user_id: current_user.id })
    @owned_sneakers_accepted = current_user.sneakers.joins(:offers).where(offers: { status: 'accepted' })
  end

  def sneaker_params
    params.require(:sneaker).permit(:title, :brand, :model, :description, :size, :price, :photo)
  end
end
