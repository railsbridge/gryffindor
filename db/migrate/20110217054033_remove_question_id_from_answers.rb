class RemoveQuestionIdFromAnswers < ActiveRecord::Migration
  def self.up
    remove_column :answers, :question_id
  end

  def self.down
    add_column :answers, :question_id, :integer, :references => :questions
  end
end
