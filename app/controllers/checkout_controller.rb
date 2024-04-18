class CheckoutController < ApplicationController
  def checkout
    @cart_watches = session[:cart]
    @customer = Customer.find_or_create_by(id: current_customer.id)

    @province = Province.find(@customer.province_id)

    @province_pst = @province.pst
    @province_gst = @province.gst
    @province_hst = @province.hst

    @total_price = calculate_total_price(@cart_watches, @customer)
    @total_pst = @total_price * @province_pst
    @total_gst = @total_price * @province_gst
    @total_hst = @total_price * @province_hst

    @total_tax = @total_pst + @total_gst + @total_hst
  end

  def create_order

    @customer = Customer.find_or_create_by(id: current_customer.id)


    @order = Order.new(customer_id: @customer.id, order_date: Time.zone.now)
    Rails.logger.debug("Order: #{@order.id}")

    province = Province.find(@customer.province_id)

    pst_at_order = province.pst
    gst_at_order = province.gst
    hst_at_order = province.hst

    if @order.save
      session[:cart].each do |watch_id, quantity|
        watch = Watch.find(watch_id)

        @order.order_details.create(
          order_id: @order.id,
          watch_id: watch_id,
          quantity: quantity,
          price_at_order: watch.current_price,
          pst_at_order: pst_at_order,
          gst_at_order: gst_at_order,
          hst_at_order: hst_at_order
        )
      end

      session[:cart] = nil

      flash[:notice] = "Order ID: #{@order.id} has been successfully created."
      redirect_to root_path
    end
  end

  def calculate_province_tax(cart_watches, customer)
    province = Province.find(customer.province_id)

    province_pst = province.pst
    province_gst = province.gst
    province_hst = province.hst

    total_tax = province_pst + province_gst + province_hst

    total_price = 0
    cart_watches.each do |watch_id, quantity|
      watch = Watch.find(watch_id)
      total_price += watch.current_price * quantity
    end

    total_tax_value = total_price * total_tax
    total_tax_value
  end


  def calculate_total_price(cart_watches,customer)
    total_price = 0

    cart_watches.each do |watch_id, quantity|
      watch = Watch.find(watch_id)
      total_price += watch.current_price * quantity + calculate_province_tax(cart_watches,customer)
    end
    total_price
  end
end
