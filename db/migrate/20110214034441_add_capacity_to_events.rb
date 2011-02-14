class AddCapacityToEvents < ActiveRecord::Migration
  def self.up
    add_column :events, :capacity, :integer, :null => false
  end

  def self.down
    remove_column :events, :capacity
  end
end
