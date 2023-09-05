
# app/models/cart.rb

class Cart < ApplicationRecord
  belongs_to :user
  has_many :cart_items, dependent: :destroy

  # Add a product to the cart
  def add_product(product, quantity)
    existing_item = cart_items.find_by(product_id: product.id)

    if existing_item
      # If the product already exists in the cart, update its quantity
      existing_item.update(quantity: existing_item.quantity + quantity)
    else
      # If the product is not in the cart, create a new cart item
      cart_items.create(product: product, quantity: quantity)
    end
  end
end
