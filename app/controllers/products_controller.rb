class ProductsController < ApplicationController
  def index
    @products = Product.all #loading all products from the Product model
  end

  def show
    @product = Product.find(params[:id]) #loading a single product from the Product model
  end
end
