class OrderDetail < ApplicationRecord
  belongs_to :watch
  belongs_to :order

  validates :quantity, :price_at_order, presence:true
  validates :quantity, numericality: { only_integer: true }
  validates :price_at_order, numericality: { only_decimal: true }
end
