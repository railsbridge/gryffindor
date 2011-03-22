class AddGuestNameAndGuestEmailToRegistrations < ActiveRecord::Migration
  def self.up
    add_column :registrations, :guest_name, :string
    add_column :registrations, :guest_email, :string
  end

  def self.down
    remove_column :registrations, :guest_name
    remove_column :registrations, :guest_email
  end
end
