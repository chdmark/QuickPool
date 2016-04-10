class CreateTrips < ActiveRecord::Migration
  def change
    create_table :trips do |t|
      t.integer :rider_id, null: false
      t.integer :driver_id, null: false
      t.string :driver_origin_loc, null: false
      t.string :rider_origin_loc, null: false
      t.string :destination_loc, null: false
      t.timestamps null: false
    end
  end
end
