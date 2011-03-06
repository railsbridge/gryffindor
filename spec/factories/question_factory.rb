Factory.define :question do |question|
  question.question_text "do you know how to foo"
  question.association :event, :factory => :event
end

Factory.define :text_question do |text_question|
  text_question.question_text "do you know how to foo"
  text_question.association :event, :factory => :event
end

Factory.define :select_question do |select_question|
  select_question.question_text "do you know how to foo: bar, baz, biz"
  select_question.association :event, :factory => :event
end
