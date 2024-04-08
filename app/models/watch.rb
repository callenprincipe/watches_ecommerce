class Watch < ApplicationRecord
  belongs_to :model
  belongs_to :brand
  belongs_to :case_material
  belongs_to :strap_material
  belongs_to :crystal_material
  belongs_to :dial_color
  belongs_to :movement_type

  has_many :order_details
  has_many :orders, through: :order_details

  validates :water_resistance, :case_diameter, :case_thickness, :current_price, :band_width, presence:true
  validates :case_diameter, :case_thickness, :current_price, numericality: { only_decimal: true }
  validates :water_resistance, :band_width, numericality: {only_integer: true}

  def self.search(search, search_by)
    if search
      if search_by == 'Brand'
        joins(:brand).where('brands.name LIKE ?', "%#{search}%")
      elsif search_by == 'Model'
        joins(:model).where('models.name LIKE ?', "%#{search}%")
      else
        joins(:brand, :model).where('brands.name LIKE ? OR models.name LIKE ?', "%#{search}%", "%#{search}%")
      end
    else
      all
    end
  end
  def self.ransackable_associations(auth_object = nil)
    ["brand", "case_material", "crystal_material", "dial_color", "model", "movement_type", "order_details", "orders", "strap_material"]
  end
  def self.ransackable_attributes(auth_object = nil)
    ["band_width", "brand_id", "case_diameter", "case_material_id", "case_thickness", "created_at", "crystal_material_id", "current_price", "dial_color_id", "id", "id_value", "model_id", "movement_type_id", "strap_material_id", "updated_at", "water_resistance"]
  end

  def to_s
    self.id
  end
end
