class AddUserIdToAnswers < ActiveRecord::Migration
  def self.up
    add_column :answers, :user_id, :integer, :references => :users
  end

  def self.down
    drop_column :answers, :user_id
  end
end
