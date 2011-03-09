module EventHelper
  def create_event(options = {})
    fill_in "event_name", :with => (options[:name])? options[:name] : "test"
    fill_in "event_capacity", :with => (options[:capacity])? optoins[:capacity] : 1
    next_day = page.find(:css, "#event_end_time_1i")[:value].to_i + 1
    select next_day.to_s, :from => "event[end_time(1i)]"
    fill_in "event[questions_attributes][0][question_text]", :with => (options[:question_text])? options[:question_text] : "test"
    select (options[:type])? options[:type] : "TextQuestion", :from => "event[questions_attributes][0][type]"
  end
end
