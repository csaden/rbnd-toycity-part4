require 'faker'
require_relative '../lib/product'

# This file contains code that populates the database with
# fake data for testing purposes

def db_seed
  # Use faker gem to generate arrays with fake brands, product names, and prices.
  10.times do
  # Create 10 new Product objects, and save them to the database
    Product.create name: Faker::Commerce.product_name, brand: Faker::Company.name, price: Faker::Commerce.price
  end
end
