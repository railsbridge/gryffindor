class RemoveUserProfiles < ActiveRecord::Migration
  def self.up
    drop_table :user_profiles
  end

  def self.down
    create_table :user_profiles do |t|
      t.timestamps
    end
  end
end
