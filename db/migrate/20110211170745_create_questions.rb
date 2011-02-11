class CreateQuestions < ActiveRecord::Migration
  def self.up
    create_table :questions do |t|
      t.integer :event_id, :references => :events
      t.timestamps
    end
  end

  def self.down
    drop_table :questions
  end
end
