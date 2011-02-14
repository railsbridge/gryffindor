class ChangeUniquenessOfUserEventIndexOnRegistrations < ActiveRecord::Migration
  def self.up
    # this index had a uniqueness constraint which we are now removing
    remove_index :registrations, [:user_id, :event_id]
    add_index :registrations, [:user_id, :event_id]
  end

  def self.down
    remove_index :registrations, [:user_id, :event_id]
    add_index :registrations, [:user_id, :event_id], :unique => true
  end
end
