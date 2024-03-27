class CreateCaseMaterials < ActiveRecord::Migration[7.1]
  def change
    create_table :case_materials do |t|
      t.string :material

      t.timestamps
    end
  end
end
