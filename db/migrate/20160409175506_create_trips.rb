class CreateTrips < ActiveRecord::Migration
  def change
    create_table :trips do |t|
      t.integer :rider_id, null: false
      t.integer :driver_id, null: false
      t.float :origin_loc, array: true, default: []
      t.float :destination_loc, array: true, default: []

      t.timestamps null: false
    end
  end
end
