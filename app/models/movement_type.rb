class MovementType < ApplicationRecord
  has_many :watches
  validates :type, presence:true
end
