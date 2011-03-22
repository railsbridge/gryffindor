class AddInviterIdToRegistrations < ActiveRecord::Migration
  def self.up
    add_column :registrations, :inviter_id, :integer
  end

  def self.down
    remove_column :registrations, :inviter_id
  end
end
