class PaymentsController < ApplicationController
  before_action :authenticate_user!

  def payment
    @order = Order.find(params[:id])
  end

  def create_checkout_session
    @order = current_user.orders.find_by(id: params[:order_id])

    if @order.present?
      session = Stripe::Checkout::Session.create(
        payment_method_types: ['card'],
        line_items: [{
          # Stripe Goods Price
          price_data: {
            currency: 'cad',
            product_data: {
              name: 'Total Order Payment',
            },
            unit_amount: (@order.total_with_taxes * 100).to_i,
          },
          quantity: 1,
        }],
        mode: 'payment',
        success_url: "http://localhost:3000/payments/success?session_id={CHECKOUT_SESSION_ID}&order_id=#{@order.id}",  # URL OF SUCCESS
        cancel_url: "http://localhost:3000/payments/cancel",  # URL OF CANCEL
      )

      render json: { sessionId: session.id }
    else
      render json: { error: 'Order not found' }, status: :not_found
    end
  end

  def success
    @order = current_user.orders.find_by(id: params[:order_id])
    @session_id = params[:session_id]
    if @order.present?
      @order.update(status: :paid);

      payment = Payment.create(
        order_id: @order.id,
        user_id: current_user.id,
        amount: @order.total_with_taxes,
        status: :successful,
        session_id: @session_id
      )
    end
  end

  # # POST /payments/create_payment_intent
  # def create_payment_intent
  #   @order = current_user.orders.find_by(id: params[:order_id])

  #   if @order.present?
  #     begin
  #       # 初始化Stripe
  #       Stripe.api_key = Rails.application.credentials.stripe[:secret_key]

  #       # Create payment intent
  #       intent = Stripe::PaymentIntent.create({
  #         amount: (@order.total_with_taxes * 100).to_i,
  #         currency: 'cad',
  #         metadata: { order_id: @order.id }
  #       })

  #       # return client_secret to client
  #       render json: { client_secret: intent.client_secret }

  #     rescue Stripe::StripeError => e
  #       render json: { error: e.message }, status: :unprocessable_entity
  #     end
  #   else
  #     render json: { error: 'Order not found.' }, status: :not_found
  #   end
  # end

end
