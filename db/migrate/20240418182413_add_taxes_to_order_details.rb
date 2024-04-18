class AddTaxesToOrderDetails < ActiveRecord::Migration[7.1]
  def change
    add_column :order_details, :hst_at_order, :decimal
    add_column :order_details, :pst_at_order, :decimal
    add_column :order_details, :gst_at_order, :decimal
  end
end
