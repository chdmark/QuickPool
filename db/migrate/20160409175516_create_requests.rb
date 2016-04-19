class CreateRequests < ActiveRecord::Migration
  def change
    create_table :requests do |t|
      t.integer :user_id, null: false
      t.boolean :active, default: true
      t.boolean :match, default: false
      t.boolean :driver, null: false
      t.string :origin_loc, null: false
      t.string :destination_loc, null: false

      t.timestamps null: false
    end
  end
end
