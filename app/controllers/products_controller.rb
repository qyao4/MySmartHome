class ProductsController < ApplicationController
  def index
    @products = Product.page(params[:page]).per(6) # 6 products per page

    if params[:search].present?
      @products = @products.where("name LIKE ? or description LIKE ?", "%#{params[:search]}%", "%#{params[:search]}%")
    end

    if params[:category].present?
      @products = @products.where(category: params[:category])
    end

  end
end
