class Province < ApplicationRecord
  has_many :customers
  validates :name, presence: true, uniqueness: true

  def self.ransackable_associations(auth_object = nil)
    ["customers"]
  end
  def self.ransackable_attributes(auth_object = nil)
    ["created_at", "gst", "hst", "id", "id_value", "name", "pst", "updated_at"]
  end
end
