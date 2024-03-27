class Customer < ApplicationRecord
  has_many :orders
  validates :name, :email, :address, presence:true
end
