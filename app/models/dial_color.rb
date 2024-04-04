class DialColor < ApplicationRecord
  has_many :watches
  validates :color, presence:true
  def to_s
    self.color
  end
end
