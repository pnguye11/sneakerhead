# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
User.delete_all
Shoe.delete_all
Tag.delete_all

nate = User.new(
  name: "nathan",
  email: "n@email.com",
  user_name: "nn23",
  password: "123",
  password_confirmation: "123"
)


kate = User.new(
  name: "kate",
  email: "k@email.com",
  user_name: "kk23",
  password: "123",
  password_confirmation: "123"
)


kate.shoes.new(
name: "dela soul",
size: 8.5,
brand: "nike",
price: 300,
condition: "Deadstock",
color: "Yellow, brown",
notes: "100\% stars"
)

nate.shoes.new(
name: "unkles",
size: 8.5,
brand: "nike",
price: 500,
condition: "Deadstock",
color: "Yellow, brown",
notes: "100\% stars"
)

kate.save
nate.save

yellow = Tag.create word: '#yellow'
purple = Tag.create word: '#dope'

nate.shoes[0].tags << [yellow, purple]

kate.shoes[0].tags << [yellow]

puts "database seeded with #{User.all.count} users, #{Shoe.all.length} shoes, and #{Tag.all.length} tags."
