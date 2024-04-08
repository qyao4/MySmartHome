# This file should ensure the existence of records required to run the application in every environment (production,
# development, test). The code here should be idempotent so that it can be executed at any point in every environment.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Example:
#
#   ["Action", "Comedy", "Drama", "Horror"].each do |genre_name|
#     MovieGenre.find_or_create_by!(name: genre_name)
#   end

# AdminUser.create!(email: 'admin@example.com', password: 'password', password_confirmation: 'password') if Rails.env.development?

# # Populate the 'categories' table with csv
# require 'csv'
# Category.destroy_all
# csv_text = File.read(Rails.root.join('db', 'categories.csv'))
# csv = CSV.parse(csv_text, headers: true)
# csv.each do |row|
#   Category.create!(
#     name: row['name'],
#     description: row['description']
#   )
# end
# puts "Imported categories from CSV"


# Populate the 'products' table with csv
# require 'csv'
# Product.destroy_all
# csv_text = File.read(Rails.root.join('db','products.csv'))
# csv = CSV.parse(csv_text, headers: true)
# csv.each do |row|
#   product = Product.create!(
#     name: row['name'],
#     description: row['description'],
#     quantity:row['quantity'].to_i,
#     price: row['price'].to_f,
#     category_id: row['category_id']
#   )
#   image_path_1 = Rails.root.join('storage', 'images', row['description'], '1.png')
#   image_path_2 = Rails.root.join('storage', 'images', row['description'], '2.jpg')

#   product.images.attach(io: File.open(image_path_1), filename: '1.png', content_type: 'image/jpg')
#   product.images.attach(io: File.open(image_path_2), filename: '2.jpg', content_type: 'image/jpg')

#   puts "info: #{row['name']} complete."
#   sleep(30) # pause 30s
# end

# puts "Imported products from CSV"


# Populate the 'provinces' table
# provinces = [
#   { name: "Alberta", abbr: "AB", gst: 5, pst: 0, hst: 0 },
#   { name: "British Columbia", abbr: "BC", gst: 5, pst: 7, hst: 0 },
#   { name: "Manitoba", abbr: "MB", gst: 5, pst: 7, hst: 0 },
#   { name: "New Brunswick", abbr: "NB", gst: 0, pst: 0, hst: 15 },
#   { name: "Newfoundland and Labrador", abbr: "NL", gst: 0, pst: 0, hst: 15 },
#   { name: "Northwest Territories", abbr: "NT", gst: 5, pst: 0, hst: 0 },
#   { name: "Nova Scotia", abbr: "NS", gst: 0, pst: 0, hst: 15 },
#   { name: "Nunavut", abbr: "NU", gst: 5, pst: 0, hst: 0 },
#   { name: "Ontario", abbr: "ON", gst: 0, pst: 0, hst: 13 },
#   { name: "Prince Edward Island", abbr: "PE", gst: 0, pst: 0, hst: 15 },
#   { name: "Quebec", abbr: "QC", gst: 5, pst: 9.96, hst: 0 },
#   { name: "Saskatchewan", abbr: "SK", gst: 5, pst: 6, hst: 0 },
#   { name: "Yukon", abbr: "YT", gst: 5, pst: 0, hst: 0 }
# ]

# provinces.each do |province|
#   Province.create(province)
# end



electronic_products = [
  "Smartphone",
  "Laptop",
  "Smartwatch",
  "Tablet",
  "E-reader",
  "Wireless Earbuds",
  "Bluetooth Speaker",
  "Portable Charger",
  "Digital Camera",
  "Action Camera"
]

1.times do
  product_name = electronic_products.sample
  Product.create!(
    name: product_name,
    description: Faker::Lorem.sentence(word_count: 20),
    quantity: Faker::Number.between(from: 1, to: 100),
    price: Faker::Commerce.price(range: 50.0..1000.0),
    discount: Faker::Commerce.price(range: 0.0..1.0),
    category_id: Category.pluck(:id).sample
  )
  puts "#{product_name} inserted." || 6
end
