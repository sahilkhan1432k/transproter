class CreateVehicles < ActiveRecord::Migration[6.1]
  def change
    create_table :vehicles do |t|
      t.string :name
      t.string :vehicle_number
      t.string :color
      t.integer :modle

      t.timestamps
    end
  end
end