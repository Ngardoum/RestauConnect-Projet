class AddRoleToUsers < ActiveRecord::Migration[6.1]
  def change
    add_column :users, :role, :integer
    add_column :users, :user_default, :string  # Renamed to avoid conflict
    add_column :users, :custom_field, :string  # Replace with a valid column name
  end
end

