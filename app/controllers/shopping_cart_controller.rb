class ShoppingCartController < ApplicationController
  def add
    session[:cart] ||= []

    watch = Watch.find(params[:id])
    session[:cart] << watch.id

    flash[:notice] = "#{watch.model.name} (ID: #{watch.id}) added to cart."

    redirect_back fallback_location: watches_path
  end

  def remove
    removed_watch_id = params[:id].to_i
    session[:cart].delete(removed_watch_id)

    removed_watch = Watch.find(removed_watch_id)

    flash[:notice] = "#{removed_watch.model.name} (ID: #{removed_watch.id}) removed from cart."

    redirect_back fallback_location: watches_path
  end

  def update_cart
    watch_id = params[:id].to_i
    new_quantity = params[:quantity].to_i

    if new_quantity > 0
      session[:cart][watch_id] = new_quantity
      flash[:notice] = "Quantity updated for watch ID: #{watch_id}."
    else
      flash[:alert] = "Invalid quantity."
    end

    redirect_back fallback_location: shopping_cart_index_path
  end

  def index
    # Retrieve the cart from the session
    @cart_items = session[:cart] || []

  end
end
