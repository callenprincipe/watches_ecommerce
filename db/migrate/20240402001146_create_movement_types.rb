class CreateMovementTypes < ActiveRecord::Migration[7.1]
  def change
    create_table :movement_types do |t|
      t.string :movement

      t.timestamps
    end
  end
end
