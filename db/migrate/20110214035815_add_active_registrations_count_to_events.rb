class AddActiveRegistrationsCountToEvents < ActiveRecord::Migration
  def self.up
    add_column :events, :active_registrations_count, :integer, :default => 0
  end

  def self.down
    remove_column :events, :active_registrations_count
  end
end
