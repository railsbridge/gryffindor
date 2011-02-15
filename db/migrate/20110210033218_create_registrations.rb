class CreateRegistrations < ActiveRecord::Migration
  def self.up
    create_table :registrations do |t|
      t.integer :user_id, :null => false
      t.integer :event_id, :null => false
      t.boolean :waitlisted

      t.timestamps
    end
    add_index :registrations, [:user_id, :event_id], :unique => true
    add_index :registrations, :event_id
  end

  def self.down
    drop_table :registrations
  end
end
