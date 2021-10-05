class AddUserRefTovehicle < ActiveRecord::Migration[6.1]
  def change
    add_reference :vehicles, :user, null: false, foreign_key: true
  end
end
