class MovementType < ApplicationRecord
  has_many :watches
  validates :movement, presence:true

  def to_s
    self.movement
  end
end
