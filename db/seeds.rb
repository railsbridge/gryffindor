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

# Admin
admin_user = User.create({:email => "admin@railsbridge.org",
                           :name => "admin",
                           :password => "password",
                           :password_confirmation => "password"})

admin_user.add_role("admin")

#Location
Factory(:location)

# Events
event = Factory(:event)

# Questions - Example data
TextQuestion.create!({:question_text => "What is a variable?", :event_id => event.id})
RadioQuestion.create!({:question_text => "I have used the command line before : Yes, No", :event_id => event.id})
RadioQuestion.create!({:question_text => "I can name __ Unix Commands : 1, 5, 10, 20, what is Unix?", :event_id => event.id})
SelectQuestion.create!({:question_text => "I heard about this group from : Google, Facebook, Sarah Mei", :event_id => event.id})
CheckBoxesQuestion.create!({:question_text => "I want to learn about : Rails, Ruby, How to start a business", :event_id => event.id})


