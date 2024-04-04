class CaseMaterial < ApplicationRecord
  has_many :watches
  validates :material, presence:true

  def self.ransackable_attributes(auth_object = nil)
    ["created_at", "id", "id_value", "material", "updated_at"]
  end

  def to_s
    self.material
  end
end
