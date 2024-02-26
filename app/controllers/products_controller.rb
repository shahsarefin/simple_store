class ProductsController < ApplicationController

  def index
    @products = Product.includes(:category).all
  end
  

  def show
    @product = Product.find(params[:id]) #loading a single product from the Product model
  
  end
end
