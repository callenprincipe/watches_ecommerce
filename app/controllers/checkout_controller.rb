class CheckoutController < ApplicationController
  def checkout
    @cart_watches = session[:cart]
    @total_price = calculate_total_price(@cart_watches)
  end

  def create_order
    # Find or create the customer based on the session data
    @customer = Customer.find_or_create_by(id: current_customer.id)

    # Create a new order for the customer with today's date
    @order = Order.new(customer_id: @customer.id, order_date: Time.zone.now)
    Rails.logger.debug("Order: #{@order.id}")
    # Save the order object
    if @order.save
      # Iterate over each item in the cart
      session[:cart].each do |watch_id, quantity|
        # Find the watch
        watch = Watch.find(watch_id)

        # Create an order detail for the watch and associate it with the order
        @order.order_details.create(
          order_id: @order.id,
          watch_id: watch_id,
          quantity: quantity,
          price_at_order: watch.current_price
        )
      end

      flash[:notice] = "Order ID: #{@order.id} has been successfully created."
      redirect_back fallback_location: shopping_cart_index_path
    else
      # Handle the case where the order couldn't be saved
      # This might include displaying an error message to the user
    end
  end

  def calculate_total_price(cart_watches)
    total_price = 0
    cart_watches.each do |watch_id, quantity|
      watch = Watch.find(watch_id)
      total_price += watch.current_price * quantity
    end
    total_price
  end
end
