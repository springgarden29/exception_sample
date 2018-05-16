# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
users = []
10000.times do |i|
  users << User.new(name: "dummy-#{i+1}", ticket_count: 0)
end
User.import users
# ticket_countをint型で許容できる最大の値にする
User.find(500).update(ticket_count: 2147483647)
