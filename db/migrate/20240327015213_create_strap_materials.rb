class CreateStrapMaterials < ActiveRecord::Migration[7.1]
  def change
    create_table :strap_materials do |t|
      t.string :material

      t.timestamps
    end
  end
end
