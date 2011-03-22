class GuestsPerUserToEvents < ActiveRecord::Migration
  def self.up
    add_column :events, :guests_per_user, :integer, :default => 0, :null => false
  end

  def self.down
    remove_column :events, :guests_per_user
  end
end
