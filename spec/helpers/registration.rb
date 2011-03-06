module RegistrationHelper
  def create_event_question(question, event)
    question.event = event
    question.reload
    click_link "Register"
  end
end
