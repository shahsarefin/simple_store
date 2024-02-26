class ProductsController < ApplicationController
  def index
    @products = Product.all #loading all products from the Product model
  end
end
