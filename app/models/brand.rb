class Brand < ApplicationRecord
  has_many :watches
  validates :name, presence:true

  def self.ransackable_associations(auth_object = nil)
    ["watches"]
  end
  def self.ransackable_attributes(auth_object = nil)
    ["created_at", "id", "id_value", "name", "updated_at"]
  end
end
