class StrapMaterial < ApplicationRecord
  has_many :watches
  validates :material, presence: true, uniqueness: true

  def to_s
    self.material
  end
end
