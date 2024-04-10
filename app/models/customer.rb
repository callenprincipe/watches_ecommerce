class Customer < ApplicationRecord
  has_many :orders
  belongs_to :province
  validates :name, :email, :address, presence:true
end
