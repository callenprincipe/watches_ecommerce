class Model < ApplicationRecord
  has_many :watches
  validates :name, presence:true
end
