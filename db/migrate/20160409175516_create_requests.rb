class CreateRequests < ActiveRecord::Migration
  def change
    create_table :requests do |t|
      t.integer :user_id, null: false
      t.boolean :match, default: false
      t.boolean :driver, null: false
      t.float :origin_loc, array: true, default: []
      t.float :destination_loc, array: true, default: []

      t.timestamps null: false
    end
  end
end
