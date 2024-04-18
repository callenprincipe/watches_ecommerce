require 'csv'

Watch.delete_all
CaseMaterial.delete_all
CrystalMaterial.delete_all
StrapMaterial.delete_all
DialColor.delete_all
MovementType.delete_all
Brand.delete_all
Model.delete_all
AdminUser.delete_all
Province.delete_all
Customer.delete_all
Order.delete_all
OrderDetail.delete_all

filename = Rails.root.join("db/luxury_watches.csv")

puts "Loading data from the CSV file: #{filename}"

csv_data = File.read(filename)
watches = CSV.parse(csv_data, headers: true, encoding: "utf-8")

watches.each do |v|
  case_material = CaseMaterial.find_or_create_by(material: v["Case Material"])
  crystal_material = CrystalMaterial.find_or_create_by(material: v["Crystal Material"])
  strap_material = StrapMaterial.find_or_create_by(material: v["Strap Material"])
  dial_color = DialColor.find_or_create_by(color: v["Dial Color"])
  movement_type = MovementType.find_or_create_by(movement: v["Movement Type"])
  brand = Brand.find_or_create_by(name: v["Brand"])
  model = Model.find_or_create_by(name: v["Model"])

  watch = Watch.create(
    water_resistance: v["Water Resistance"].to_i,
    case_diameter: v["Case Diameter"].to_f,
    case_thickness: v["Case Thickness"].to_f,
    band_width: v["Band Width"].to_i,
    current_price: v["Price"].to_f,
    case_material: case_material,
    crystal_material: crystal_material,
    strap_material: strap_material,
    dial_color: dial_color,
    movement_type: movement_type,
    brand: brand,
    model: model
  )

end

PROVINCES = [
  { name: 'Alberta', pst: 0.0, gst: 0.05, hst: 0.0 },
  { name: 'British Columbia', pst: 0.07, gst: 0.05, hst: 0.0 },
  { name: 'Manitoba', pst: 0.07, gst: 0.05, hst: 0.0 },
  { name: 'New Brunswick', pst: 0.0, gst: 0.0, hst: 0.15 },
  { name: 'Newfoundland and Labrador', pst: 0.0, gst: 0.00, hst: 0.15 },
  { name: 'Northwest Territories', pst: 0.0, gst: 0.05, hst: 0.0 },
  { name: 'Nova Scotia', pst: 0.0, gst: 0.00, hst: 0.15 },
  { name: 'Nunavut', pst: 0.0, gst: 0.05, hst: 0.0 },
  { name: 'Ontario', pst: 0.0, gst: 0.0, hst: 0.13 },
  { name: 'Prince Edward Island', pst: 0.0, gst: 0.0, hst: 0.15 },
  { name: 'Quebec', pst: 0.09975, gst: 0.00, hst: 0.0 },
  { name: 'Saskatchewan', pst: 0.06, gst: 0.05, hst: 0.0 },
  { name: 'Yukon', pst: 0.0, gst: 0.05, hst: 0.0 }
]


PROVINCES.each do |province_data|
  Province.find_or_create_by!(name: province_data[:name]) do |province|
    province.pst = province_data[:pst]
    province.gst = province_data[:gst]
    province.hst = province_data[:hst]
  end
end

puts "Created #{Province.count} Provinces."
puts "Created #{Watch.count} Watches."
puts "Created #{CaseMaterial.count} Case Materials."
puts "Created #{CrystalMaterial.count} Crystal Materials."
puts "Created #{StrapMaterial.count} Strap Materials."
puts "Created #{DialColor.count} Dial Colors."
puts "Created #{MovementType.count} Movement Types."
puts "Created #{Brand.count} Brands."
puts "Created #{Model.count} Models."
AdminUser.create!(email: 'admin@example.com', password: 'password', password_confirmation: 'password') if Rails.env.development?