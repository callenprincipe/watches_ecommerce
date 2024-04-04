ActiveAdmin.register Watch do

  # See permitted parameters documentation:
  # https://github.com/activeadmin/activeadmin/blob/master/docs/2-resource-customization.md#setting-up-strong-parameters
  #
  # Uncomment all parameters which should be permitted for assignment
  #
  permit_params :model_id, :brand_id, :case_material_id, :strap_material_id, :crystal_material_id, :dial_color_id, :movement_type_id, :water_resistance, :case_diameter, :case_thickness, :band_width, :current_price
  #
  # or
  #
  # permit_params do
  #   permitted = [:model_id, :brand_id, :case_material_id, :strap_material_id, :crystal_material_id, :dial_color_id, :movement_type_id, :water_resistance, :case_diameter, :case_thickness, :band_width, :current_price]
  #   permitted << :other if params[:action] == 'create' && current_user.admin?
  #   permitted
  # end

end
