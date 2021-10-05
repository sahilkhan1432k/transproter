class CreateVehicleMaterials < ActiveRecord::Migration[6.1]
  def change
    create_table :vehicleMterials do |t|
      t.belongs_to :meterail
      t.belongs_to :vehicle

      t.timestamps
    end
  end
end
