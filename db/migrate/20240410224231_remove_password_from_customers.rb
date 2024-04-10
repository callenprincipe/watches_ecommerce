class RemovePasswordFromCustomers < ActiveRecord::Migration[7.1]
  def change
    remove_column :customers, :password, :string
  end
end
