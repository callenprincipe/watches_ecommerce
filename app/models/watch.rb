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

  validates :water_resistance, :case_diameter, :case_thickness, :current_price, presence:true
  validates :case_diameter, :case_thickness, :current_price, numericality: { only_decimal: true }
  validates :water_resistance, numericality: {only_integer: true}
end
