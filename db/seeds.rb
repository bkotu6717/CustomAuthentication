# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

#Use the below user for login
User.create(email: 'user@example.com', password: '12345', password_confirmation: '12345' )

20.times { 
	fake_pasword = Faker::Internet.password
	User.create(email: Faker::Internet.email, password: fake_pasword, password_confirmation: fake_pasword )
}