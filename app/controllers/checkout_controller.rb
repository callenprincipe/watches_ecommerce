class CheckoutController < ApplicationController
  def checkout
    @cart_watches = session[:cart]
    @total_price = calculate_total_price(@cart_watches)
    @customer = Customer.new
  end

  def create_order
    @customer = Customer.find_or_create_by(customer_params)
    @order = Order.create(customer_id: @customer.id, product_ids: session[:cart])
    redirect_to confirmation_path
  end

  def calculate_total_price(cart_watches)
    total_price = 0
    cart_watches.each do |watch_id, quantity|
      watch = Watch.find(watch_id)
      total_price += watch.current_price * quantity
    end
    total_price
  end

  def customer_params
    params.require(:customer).permit(:name, :email, :address, :province)
  end
end
