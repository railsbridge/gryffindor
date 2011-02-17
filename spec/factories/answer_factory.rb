Factory.define :answer do |answer|
  answer.answer_text "I surely know how to bar"
  answer.association :question, :factory => :question
  answer.association :registration, :factory => :registration
end
