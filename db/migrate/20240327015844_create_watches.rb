class CreateWatches < ActiveRecord::Migration[7.1]
  def change
    create_table :watches do |t|
      t.references :model, null: false, foreign_key: true
      t.references :brand, null: false, foreign_key: true
      t.references :case_material, null: false, foreign_key: true
      t.references :strap_material, null: false, foreign_key: true
      t.references :crystal_material, null: false, foreign_key: true
      t.references :dial_color, null: false, foreign_key: true
      t.references :movement_type, null: false, foreign_key: true
      t.integer :water_resistance
      t.decimal :case_diameter
      t.decimal :case_thickness
      t.integer :band_width
      t.decimal :current_price

      t.timestamps
    end
  end
end
