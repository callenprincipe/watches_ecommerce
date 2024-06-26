class ShoppingCartController < ApplicationController
  def add
    session[:cart] ||= {}

    watch_id = params[:id].to_i
    watch = Watch.find(watch_id)

    session[:cart] = session[:cart].to_h

    if session[:cart].key?(watch_id)
      session[:cart][watch_id] += 1
    else
      session[:cart][watch_id] = 1
    end

    flash[:notice] = "#{watch.model.name} (ID: #{watch.id}) added to cart."

    redirect_back fallback_location: watches_path
  end


  def remove
    removed_watch_id = params[:id]

    session[:cart] ||= {}

    session[:cart].delete(removed_watch_id)

    removed_watch = Watch.find_by(id: removed_watch_id)

    if removed_watch
      flash[:notice] = "#{removed_watch.model.name} (ID: #{removed_watch.id}) removed from cart."
    else
      flash[:alert] = "Watch with ID: #{removed_watch_id} not found in the cart."
    end

    redirect_back fallback_location: watches_path
  end


  def update_cart
    watch_id = params[:id]
    new_quantity = params[:quantity].to_i

    updated_watch = Watch.find_by(id: watch_id)

    if new_quantity > 0
      session[:cart] ||= {}

      session[:cart][watch_id] = new_quantity

      session[:cart].delete(watch_id) if new_quantity.zero?

      flash[:notice] = "Quantity updated for #{updated_watch.model.name} (ID: #{watch_id})."
    else
      flash[:alert] = "Invalid quantity."
    end

    redirect_back fallback_location: shopping_cart_index_path
  end

  def index
    @cart_items = session[:cart] || []
    @customer_name = current_customer.name if customer_signed_in?
  end
end
