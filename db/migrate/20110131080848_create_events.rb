class CreateEvents < ActiveRecord::Migration
  def self.up
    create_table :events do |t|
      t.string :name, :null => false
      t.integer :location_id, :null => false
      t.datetime :start_time, :null => false
      t.datetime :end_time, :null => false
      t.text :notes

      t.timestamps
    end
  end

  def self.down
    drop_table :events
  end
end
