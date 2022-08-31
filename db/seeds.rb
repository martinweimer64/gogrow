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

if Sale.count == 0 && User.count > 1 && Product.count == 0

  puts "Creating seeds products..."
  products = Product.create!([
    {name: "TV 32' Sorny", code: "TVS032"},
    {name: "Notebook Hell", code: "NTB001"},
    {name: "TV 88' Panafonic", code: "TVP088"},
    {name: "Notebook Mapple", code: "NTB002"}
  ])
  puts "Added #{products.count} products"
  puts "Creating seeds sales..."
  sales = Sale.create!([
    {code: "SALE001", order_date: DateTime.yesterday, vendor: User.first, buyer: User.second},
    {code: "SALE002", order_date: DateTime.yesterday, vendor: User.first, buyer: User.second},
    {code: "SALE003", order_date: DateTime.now, vendor: User.first, buyer: User.second},
    {code: "SALE004", order_date: DateTime.now, vendor: User.first, buyer: User.second}
  ])
  puts "Added #{sales.count} Sales"
  puts "Adding products to sales..."
  sales.first.products << [products.first]
  sales.second.products << [products.first, products.second]
  sales.third.products << [products.third]
  sales.fourth.products << [products.first, products.second, products.third, products.fourth]
end

puts "Seed import finished successfully"

