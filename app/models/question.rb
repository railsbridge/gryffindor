class Question < ActiveRecord::Base
  has_many :answers
  belongs_to :event

  validates_presence_of :question_text

  # TODO evaluate type and determine correct helper tag to use
  def print_tag
  end
end
