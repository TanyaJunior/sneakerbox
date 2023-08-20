# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)
# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
require "open-uri"
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)
puts "clearing database..."
Offer.destroy_all
Sneaker.destroy_all
User.destroy_all

puts "database cleared"
puts "creating users..."

    # user1 = User.create!(
    #   email: "user1@example.com",
    #   password: "password"
    # )
    # user2 = User.create!(
    #   email: "user2@example.com",
    #   password: "password"
    # )

kanye_west = User.create!(
  email: "kanye@west.com",
  password: "password"
)

puts "#{User.count} users created"

puts "Creating Sneakers..."
sneaker_1 = Sneaker.create!(
  title: "Nike",
  brand: "Nike",
  model: "Dunks low Clear Jade",
  description: "Inspired by our 70s heritage designs, the 327 men's running shoes boast unmatched comfort and a casual aesthetic.",
  size: 7,
  price: 2000,
  status: 0,
  user: kanye_west
)

file_1 = URI.open("https://res.cloudinary.com/dw1yozuyk/image/upload/v1691755359/c22-NIKE-DV0833-101-NIKE-DUNK-LOW-RETRO-BTTYS-WHITECLEAR-JADE-WHITE-side-YCO_x1pjy8.webp")
sneaker_1.photo.attach(io: file_1, filename: "Sneaker_1.img", content_type: "image/jpg")
sneaker_1.save

puts "#{Sneaker.count} sneakers created"
