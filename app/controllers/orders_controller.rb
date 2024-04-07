class OrdersController < ApplicationController

  before_action :authenticate_user! #, only: [:new, :create]
  before_action :set_user


  def index
    @orders = current_user.orders.includes(order_items: :product)
  end


  def new
    @order = Order.new

    @total_quantity = 0
    @total_price = 0
    @ref = params[:ref]

    if params[:ref] == 'product'
      product = Product.find(params[:product_id]) if params[:product_id]
      quantity = 1
      @total_quantity = quantity
      @total_price = product.price
      @products = [[product, quantity]]
      # Calculate taxes and final total
      calculate_taxes
    elsif params[:ref] == 'cart'
      @cart = session[:cart] || {}
      @products = Product.where(id: @cart.keys).map do |product|
        quantity = @cart[product.id.to_s].to_i
        @total_quantity += quantity
        @total_price += product.price * quantity
        [product, quantity]
      end
      # Calculate taxes and final total
      calculate_taxes
    else
      # from order...
      order_id = params[:order_id]
      # search for order by order_id
      @existing_order = Order.find_by(id: order_id, user: current_user)
      if @existing_order.present?
        @products = @existing_order.order_items.includes(:product).map do |item|
          product = item.product
          quantity = item.quantity
          @total_quantity += quantity
          @total_price += item.price * quantity
          [product, quantity]
        end
        @total_with_taxes = @existing_order.total_with_taxes
        @gst = @existing_order.gst
        @pst = @existing_order.pst
      else
        redirect_to orders_path, alert: 'Order not found.'
      end
    end


  end

  def create

    puts "======= ORDER CREATE PARAMS ======="
    puts  params.inspect
    puts "======================"

    puts "ref:#{params[:order][:ref]}"
    puts "refid:#{params[:refid]}"

    if  params[:order][:ref] == 'order'
      redirect_to payment_path(id:params[:order][:refid]), notice: 'Order was being paid.'
      return;
    end

    @order = current_user.orders.build(order_params)
    # calculate_taxes_for(@order)

    if @order.save
      # session[:cart] = nil if params[:ref] == 'cart'
      flash[:notice] = "Order was successfully created.!"

      redirect_to payment_path(id:@order.id), notice: 'Order was successfully created.'
    else
      flash.now[:alert] = 'There was a problem creating your order.'
      #render :new
      redirect_back(fallback_location: new_order_path)
    end
  end

  def show
    @order = Order.find(params[:id])
  end

  def set_user
    @user = current_user if user_signed_in?
  end

  def calculate_taxes
    gst_rate = (@user.province.gst || 0) / 100.0
    pst_rate = (@user.province.pst || @user.province.hst || 0) / 100.0

    @gst = (@total_price * gst_rate).round(2)
    @pst = (@total_price * pst_rate).round(2)

    @total_with_taxes = (@total_price + @gst + @pst).round(2)
  end

  def calculate_taxes_for(order)
    gst_rate = (order.province.gst || 0) / 100.0
    pst_rate = (order.province.pst || order.province.hst || 0) / 100.0

    order_items_total = order.order_items.sum { |item| item.price * item.quantity }

    gst = (order_items_total * gst_rate).round(2)
    pst = (order_items_total * pst_rate).round(2)

    order.gst = gst
    order.pst = pst
    order.total_price = (order_items_total + gst + pst).round(2)
  end

  private
    def order_params
      # params.require(:order).permit(:user_id, :product_id, :quantity, :total_price, :gst, :pst, :total_with_taxes)
      params.require(:order).permit(
      :address,
      :city,
      :province_id,
      :post_code,
      :status,
      :gst,
      :pst,
      :total_with_taxes,
      order_items_attributes: [:product_id, :quantity, :price]
    )
    end
end
