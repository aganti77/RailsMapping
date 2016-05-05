class CreateLocations < ActiveRecord::Migration
  def change
    create_table :locations do |t|
      t.string :address
      t.string :permitID
      t.string :typeCode
      t.string :typeName
      t.string :appDes
      t.string :dateIssued
      t.string :status
      t.string :conName
      t.string :conAddr1
      t.string :city
      t.string :state
      t.string :zip

      t.timestamps null: false
    end
  end
end
