class Watch < ApplicationRecord
  belongs_to :model
  belongs_to :brand
  belongs_to :case_material
  belongs_to :strap_material
  belongs_to :crystal_material
  belongs_to :dial_color
  belongs_to :movement_type
end
