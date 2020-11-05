# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

jon = User.create!(email: 'Jon@example.com', password: 'password')
kanon = User.create!(email: 'kanon@example.com', password: 'password')

jon.boards.create(title: 'nameですよ', description: '詳細ですよ')
kanon.boards.create(title: 'nameですおおお', description: '詳細ですよおおおおお')