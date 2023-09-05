# db/seeds.rb
require 'faker'

# Seed Brands
# Define a custom list of shoe brand names
shoe_brands = ['Nike', 'Adidas', 'Etec', 'Puma', 'Reebok', 'New Balance', 'Converse', 'Under Armour', 'Vans']

# Create shoe company brands using Faker and the custom list
shoe_brands.each do |brand_name|
  Brand.create(name: brand_name)
end

# Create additional random brands using Faker
(5 - shoe_brands.length).times do
  Brand.create(name: Faker::Company.unique.name)
end

# Seed Products associated with Brands
# 10.times do
#   product = Product.create(
#     name: Faker::Commerce.product_name,
#     description: Faker::Lorem.sentence,
#     price: Faker::Commerce.price(range: 50..200.0, as_string: true),
#     image_url: Faker::LoremPixel.image,
#     gender: ['men', 'women'].sample,
#     style: ['casual', 'official'].sample,
#     brand: Brand.all.sample
#   )
# end
10.times do
    product = Product.create(
      name: Faker::Commerce.product_name,
      description: Faker::Lorem.sentence,
      price: Faker::Commerce.price(range: 50..200.0, as_string: true),
      image_url: Faker::Internet.url(host: 'example.com', path: '/image.jpg'),
      gender: ['men', 'women'].sample,
      style: ['casual', 'official'].sample,
      brand: Brand.all.sample
    )
  end