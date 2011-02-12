class Question < ActiveRecord::Base
  has_many :answers
  belongs_to :event

  validates_presence_of :question_text

  # TODO evaluate type and determine correct helper tag to use
  def self.input_tag(question, name)
    return "<strong>#{question.question_text}</strong><br />
            <input type='#{question.type.downcase}' name='#{name}'/>"
  end
end
