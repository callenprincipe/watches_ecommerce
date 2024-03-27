class StrapMaterial < ApplicationRecord
  has_many :watches
  validates :material, presence: true, uniqueness: true
end
