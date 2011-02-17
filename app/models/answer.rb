class Answer < ActiveRecord::Base
  belongs_to :question
  belongs_to :answers

  validates_presence_of :answer_text
end
