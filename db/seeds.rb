# db/seeds.rb
require 'faker'

# Seed Brands
5.times do
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