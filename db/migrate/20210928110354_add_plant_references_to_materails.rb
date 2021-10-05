class AddPlantReferencesToMeterails < ActiveRecord::Migration[6.1]
  def change
    add_reference :materials, :plant, null: false, foreign_key: true
  end
end
