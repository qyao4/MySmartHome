class ProductsController < ApplicationController
  def index
    @products = Product.page(params[:page]).per(6) # 6 products per page
  end
end
