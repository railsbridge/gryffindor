class Question < ActiveRecord::Base
  has_many :answers
  belongs_to :event

  validates_presence_of :question_text

  def form_type
    (self.class).to_s.slice(/(.)+(?=Question)/).downcase
  end

  def options
    (self.question_text.split(":")[1]).split(",")
  end

end
