class OrdersController < ApplicationController
  before_action :set_order, only: %i[ show edit update destroy ]

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

  def calculate_tax(province)
    # Define tax rates for each province
    tax_rates = {
      "Alberta" => 0.05,
      "British Columbia" => 0.12,
      "Ontario" => 0.13,
      # Add more provinces as needed
    }

    # Calculate tax based on the provided province
    tax_rate = tax_rates[province.capitalize]
    tax = @total_price * (tax_rate || 0)
    tax
  end

  def customer_params
    params.require(:customer).permit(:name, :email, :address, :province)
  end

  # GET /orders or /orders.json
  def index
    @orders = Order.all
  end

  # GET /orders/1 or /orders/1.json
  def show
  end

  # GET /orders/new
  def new
    @order = Order.new
  end

  # GET /orders/1/edit
  def edit
  end

  # POST /orders or /orders.json
  def create
    @order = Order.new(order_params)

    respond_to do |format|
      if @order.save
        format.html { redirect_to order_url(@order), notice: "Order was successfully created." }
        format.json { render :show, status: :created, location: @order }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @order.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /orders/1 or /orders/1.json
  def update
    respond_to do |format|
      if @order.update(order_params)
        format.html { redirect_to order_url(@order), notice: "Order was successfully updated." }
        format.json { render :show, status: :ok, location: @order }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @order.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /orders/1 or /orders/1.json
  def destroy
    @order.destroy!

    respond_to do |format|
      format.html { redirect_to orders_url, notice: "Order was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_order
      @order = Order.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def order_params
      params.require(:order).permit(:customer_id, :order_date)
    end
end
