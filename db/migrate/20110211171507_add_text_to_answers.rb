class AddTextToAnswers < ActiveRecord::Migration
  def self.up
    add_column :answers, :answer_text, :string
  end

  def self.down
    remove_column :answers, :answer_text
  end
end
