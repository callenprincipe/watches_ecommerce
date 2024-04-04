class OrderDetail < ApplicationRecord
  belongs_to :watch
  belongs_to :order

  validates :quantity, :price_at_order, presence:true
  validates :quantity, numericality: { only_integer: true }
  validates :price_at_order, numericality: { only_decimal: true }




  def self.ransackable_attributes(auth_object = nil)
    ["created_at", "id", "id_value", "order_id", "price_at_order", "quantity", "updated_at", "watch_id"]
  end
end
