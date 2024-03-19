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
