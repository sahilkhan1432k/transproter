class AddForeignKeyToUser < ActiveRecord::Migration[6.1]
  def change
    add_column :users, :first_driver_id, :integer
    add_column :users, :second_driver_id, :integer

  end
end
