class CrystalMaterial < ApplicationRecord
  has_many :watches
  validates :material, presence:true

  def to_s
    self.material
  end
end
