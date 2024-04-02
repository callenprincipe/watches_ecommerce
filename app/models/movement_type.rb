class MovementType < ApplicationRecord
  has_many :watches
  validates :movement, presence:true
end
