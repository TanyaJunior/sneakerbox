class CategoriesController < ApplicationController
  def index
    @sneaker_brands = Sneaker.distinct.pluck(:brand)
    @sneakers_by_brand = {}

    @sneaker_brands.each do |brand|
      @sneakers_by_brand[brand] = Sneaker.where(brand: brand)
    end
  end
end

