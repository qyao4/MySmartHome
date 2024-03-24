class CartsController < ApplicationController
  # Display the shopping cart
  def show

    puts "======= Session ======="
    puts session[:cart].inspect
    puts "======================"

    # Initialize the cart from the session or as an empty hash
    @cart = session[:cart] || {}

    # Initialize @total_price for calculating the total price of the cart
    @total_quantity = 0
    @total_price = 0

    # Convert the cart from a hash of product IDs and quantities to a list of product objects and quantities
    @cart_items = @cart.map do |product_id, quantity|
      product = Product.find(product_id)
      # Accumulate the total price
      @total_quantity += quantity
      @total_price += product.price * quantity
      [product, quantity]
    end
  end

  # Add a product to the shopping cart
  def add_to_cart

    puts "======= PARAMS ======="
    puts params.inspect
    puts "======================"

    puts "======= Session ======="
    puts session[:cart].inspect
    puts "======================"

    product_id = params[:product_id].to_s  # Ensure the product_id is a string, as it is used as a key in the session hash

    # Initialize the session cart as a hash if it doesn't exist
    session[:cart] ||= {}

    # If the product is already in the cart, increment its quantity. Otherwise, add it with a quantity of 1.
    session[:cart][product_id] = (session[:cart][product_id] || 0) + 1

    # Set a flash message to give feedback to the user that the product has been added
    flash[:notice] = "Product added to cart successfully!"

    # Redirect back to the shopping cart page
    # redirect_to cart_path
    # redirect_back(fallback_location: root_path)

    redirect_to product_path(product_id)
  end
end
