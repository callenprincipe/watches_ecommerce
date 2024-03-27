class DialColor < ApplicationRecord
  has_many :watches
  validates :color, presence:true
end
