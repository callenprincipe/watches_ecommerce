class CreateCrystalMaterials < ActiveRecord::Migration[7.1]
  def change
    create_table :crystal_materials do |t|
      t.string :material

      t.timestamps
    end
  end
end
