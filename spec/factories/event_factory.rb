Factory.define :event do |f|
  f.name "Railsbridge Meetup, woo"
  f.association :location, :factory => :location
  f.start_time  Date.parse("Jan 1")
  f.end_time  Date.parse("Jan 2")
  f.capacity  10
end
