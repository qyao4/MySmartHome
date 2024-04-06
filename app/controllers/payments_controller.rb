class PaymentsController < ApplicationController
  def payment
    @order = Order.find(params[:id])
  end
end
