class AddTextAndTypeToQuestions < ActiveRecord::Migration
  def self.up
    add_column :questions, :question_text, :string

    # TODO "type" implies STI later on down the road
    add_column :questions, :type, :string
  end

  def self.down
    remove_column :questions, :question_text
    remove_column :questions, :type
  end
end
