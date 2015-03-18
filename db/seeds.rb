# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

# Create admin account

User.new do |admin|
  admin.name     = 'Gannon'
  admin.email    = 'gannon.mcgibbon@gmail.com'
  admin.password = '123admin'
  admin.password_confirmation = '123admin'
  admin.role = 2 # admin
  admin.save!
end
