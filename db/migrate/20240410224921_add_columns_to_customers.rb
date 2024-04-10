class AddColumnsToCustomers < ActiveRecord::Migration[7.1]
  def change
    add_column :customers, :name, :string
    add_column :customers, :address, :string
    add_reference :customers, :province, null: false, foreign_key: true
  end
end
