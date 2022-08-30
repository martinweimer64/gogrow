# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)

if User.count == 0
  puts "Creating seeds users..."
  User.create!([
    {name: "Vendor User", code: "ABC123", email: "vendor@gmail.com"},
    {name: "Buyer User", email: "buyer@gmail.com"}
  ])
end

if Product.count == 0
  puts "Creating seeds products..."
  Product.create!([
    {name: "TV 32\" Sorny", code: "TVS032"},
    {name: "TV 88\" Panafonic", code: "TVP088"}
  ])
end

if Sale.count == 0 && User.count > 1
  puts "Creating seeds sales..."
  Sale.create!([
    {code: "SALE001", order_date: DateTime.yesterday, vendor: User.first, buyer: User.second},
    {code: "SALE002", order_date: DateTime.yesterday, vendor: User.first, buyer: User.second},
    {code: "SALE003", order_date: DateTime.now, vendor: User.first, buyer: User.second},
    {code: "SALE004", order_date: DateTime.now, vendor: User.first, buyer: User.second}
  ])
end