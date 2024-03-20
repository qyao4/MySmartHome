class ProductsController < ApplicationController
  def index
    @products = Product.page(params[:page]).per(6) # 6 products per page

    if params[:search].present?
      @products = @products.where("name LIKE ? or description LIKE ?", "%#{params[:search]}%", "%#{params[:search]}%")
    end

    # Filter by category
    if params[:category].present?
      @products = @products.where(category: params[:category])
    end

    # Filter products that are on sale
    if params[:on_sale].present? && params[:on_sale] == 'true'
      @products = @products.where("discount > 0 AND discount < 1")
    end

    # Filter new products
    if params[:new].present? && params[:new] == 'true'
      @products = @products.where("created_at > ?", 3.days.ago)
    end

    # Filter recently updated products
    # Excludes new products from being considered as recently updated
    if params[:recently_updated].present? && params[:recently_updated] == 'true'
      @products = @products.where("updated_at > ? AND created_at <= ?", 3.days.ago, 3.days.ago)
    end

  end
end
