class CreateTasks < ActiveRecord::Migration
  def change
    create_table :tasks do |t|
      t.integer :user_id
      t.integer :courier_id
      t.string  :name
      t.text    :description
      t.time    :time
      t.integer :price
      t.string  :from_address
      t.float   :from_lat
      t.float   :from_lng
      t.string  :to_address
      t.float   :to_lat
      t.float   :to_lng
      t.timestamps
    end
  end
end