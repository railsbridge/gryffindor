class AddQuestionIdToAnswers < ActiveRecord::Migration
  def self.up
    add_column :answers, :question_id, :integer, :references => :questions
  end

  def self.down
    remove_column :answers, :question_id
  end
end
