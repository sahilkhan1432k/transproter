class AddDetialToUser < ActiveRecord::Migration[6.1]
  def change
    add_column :users, :first_name, :string
    add_column :users, :last_name, :string
    add_column :users, :address, :string
    add_column :users, :licence_number, :string
    add_column :users, :birthday, :date
    add_column :users, :user_type, :string
  end
end
