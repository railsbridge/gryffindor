Factory.define :question do |question|
  question.question_text "do you know how to foo"
  question.association :event, :factory => :event
end
