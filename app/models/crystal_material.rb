class CrystalMaterial < ApplicationRecord
  has_many :watches
  validates :material, presence:true
end
