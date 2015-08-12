# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ :name => 'Chicago' }, { :name => 'Copenhagen' }])
#   Mayor.create(:name => 'Emanuel', :city => cities.first)

v = Volunteer.new
v.email = "codefordenver@gmail.com"
v.password = "dev12345"
v.admin = true
v.assigned = true
v.save!

r = Region.create!

a = Assignment.new
a.volunteer = v
a.region = r
a.admin = v.admin
a.save!
