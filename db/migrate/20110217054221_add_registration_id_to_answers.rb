class AddRegistrationIdToAnswers < ActiveRecord::Migration
  def self.up
    add_column :answers, :registration_id, :integer, :references => :registrations
  end

  def self.down
    remove_column :answers, :registration_id
  end
end
