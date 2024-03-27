class OrderDetail < ApplicationRecord
  belongs_to :watch
  belongs_to :order
end
