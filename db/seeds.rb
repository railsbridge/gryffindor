# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ :name => 'Chicago' }, { :name => 'Copenhagen' }])
#   Mayor.create(:name => 'Daley', :city => cities.first)

# Roles
admin = Role.create( :name => 'admin' )
organizer = Role.create( :name => 'organizer' )

#Location
Factory(:location)

# Events
event = Factory(:event)

# Questions - Example data
TextQuestion.create!({:question_text => "Do you know what a variable is?", :event_id => event.id})
TextQuestion.create!({:question_text => "Have you used the command line?", :event_id => event.id})
TextQuestion.create!({:question_text => "I can name 5 UNIX commands.", :event_id => event.id})
TextQuestion.create!({:question_text => "How did you hear about this group?", :event_id => event.id})
TextQuestion.create!({:question_text => "What do you want to learn from this workshop?", :event_id => event.id})


