class CreateMeterials < ActiveRecord::Migration[6.1]
  def change
    create_table :meterials do |t|
      t.string :name
      t.decimal :cost

      t.timestamps
    end
  end
end
