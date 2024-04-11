class ShoppingCartController < ApplicationController
  def add
    session[:cart] ||= {}

    watch_id = params[:id].to_i
    watch = Watch.find(watch_id)

    # Ensure session[:cart] is a hash
    session[:cart] = session[:cart].to_h

    # Ensure the cart item exists
    if session[:cart].key?(watch_id)
      # Increment the quantity if the watch is already in the cart
      session[:cart][watch_id] += 1
    else
      # Add the watch to the cart with quantity 1 if it's not already in the cart
      session[:cart][watch_id] = 1
    end

    flash[:notice] = "#{watch.model.name} (ID: #{watch.id}) added to cart."

    redirect_back fallback_location: watches_path
  end


  def remove
    removed_watch_id = params[:id]

    # Ensure session[:cart] is initialized as a hash
    session[:cart] ||= {}

    # Delete the watch ID from the cart
    session[:cart].delete(removed_watch_id)

    # Retrieve the removed watch
    removed_watch = Watch.find_by(id: removed_watch_id)

    # Check if the watch was found and removed
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

    # Ensure new quantity is positive
    if new_quantity > 0
      # Retrieve the cart from the session or initialize an empty hash
      session[:cart] ||= {}

      # Update the quantity of the specified watch in the cart hash
      session[:cart][watch_id] = new_quantity

      # Remove the watch entry if the quantity is zero
      session[:cart].delete(watch_id) if new_quantity.zero?

      flash[:notice] = "Quantity updated for #{updated_watch.model.name} (ID: #{watch_id})."
    else
      flash[:alert] = "Invalid quantity."
    end

    # Redirect to the previous page
    redirect_back fallback_location: shopping_cart_index_path
  end

  def index
    @cart_items = session[:cart] || []
    @customer_name = current_customer.name if customer_signed_in?
  end
end
