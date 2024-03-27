class Order < ApplicationRecord
  belongs_to :customer

  has_many :order_details
  has_many :watches,through: :order_details

  validates :order_date, presence:true
end
