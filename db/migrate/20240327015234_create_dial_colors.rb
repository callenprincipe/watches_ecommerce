class CreateDialColors < ActiveRecord::Migration[7.1]
  def change
    create_table :dial_colors do |t|
      t.string :color

      t.timestamps
    end
  end
end
