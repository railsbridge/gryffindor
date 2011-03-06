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

# Questions - Example data
Question.create({:question_text => "Do you know what a variable is?", :type => "Text"})
Question.create({:question_text => "Have you used the command line?", :type => "Text"})
Question.create({:question_text => "I can name 5 UNIX commands.", :type => "Text"})
Question.create({:question_text => "How did you hear about this group?", :type => "Text"})
Question.create({:question_text => "What do you want to learn from this workshop?", :type => "Text"})

# Admin
admin_user = User.create({:name => "admin", 
              :email => "admin@railsbridge.com", 
              :password=>"admin", 
              :password_confirmation => "admin",
              :role => admin})
