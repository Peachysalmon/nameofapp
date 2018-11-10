class PaymentsController < ApplicationController
  def create
    @product = Product.find(params[:product_id])
    @user = current_user
    token = params[:stripeToken]
    # Create the charge on Stripe's servers - this will charge the user's card
    begin
      charge = Stripe::Charge.create(
        amount: @product.price.to_i*100, # amount in cents, again
        currency: "eur",
        source: token,
        description: params[:stripeEmail]
      )
      if charge.paid
        Order.create( product_id: @product.id, user_id: @user.id, total: @order.total)
        flash[:success] = "Your payment was processed successfully"
      end

    rescue Stripe::CardError => e
      # The card has been declined
      body = e.json_body
      err = body[:error]
      flash[:error] = "Unfortunately, there was an error processing your payment: #{err[:message]}"
    end
    redirect_to payments_create_path, notice: "Thank you for your purchase."
  end
end
