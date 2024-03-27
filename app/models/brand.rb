class Brand < ApplicationRecord
  has_many :watches
  validates :brand, presence:true
end
