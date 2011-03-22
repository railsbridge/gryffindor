class ChangeUserIdToNullableOnRegistrations < ActiveRecord::Migration
  def self.up
    change_column :registrations, :user_id, :integer, :null => true
  end

  def self.down
    change_column :registrations, :user_id, :integer, :null => false
  end
end
