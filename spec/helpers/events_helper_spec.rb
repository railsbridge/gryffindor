module EventHelper
  def create_event(options = {})
    fill_in "event_name", :with => (options[:name])? options[:name] : "test"
    fill_in "event_capacity", :with => (options[:capacity])? optoins[:capacity] : 1
    fill_in "event_questions_attributes_0_question_text", :with => (options[:question_text])? options[:question_text] : "test"
    select (options[:type])? options[:type] : "TextQuestion", :from => "event_questions_attributes_0_type"
  end
end
