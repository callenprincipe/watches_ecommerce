class Brand < ApplicationRecord
  has_many :watches
  validates :name, presence:true
end
