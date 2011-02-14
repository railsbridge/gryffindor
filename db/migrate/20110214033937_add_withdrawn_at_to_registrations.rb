class AddWithdrawnAtToRegistrations < ActiveRecord::Migration
  def self.up
    add_column :registrations, :withdrawn_at, :datetime
  end

  def self.down
    remove_column :registrations, :withdrawn_at
  end
end
