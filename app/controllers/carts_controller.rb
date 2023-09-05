# app/controllers/carts_controller.rb

class CartsController < ApplicationController
    before_action :authenticate_user!
  
    # GET /carts
    def show
      @cart = current_user.cart
      render json: @cart
    end
  
    
    def add_item
      user = current_user
    
      # Ensure the user has a cart
      user.create_cart unless user.cart
    
      product_id = params[:product_id]
      quantity = params[:quantity]
    
      # Find the product based on product_id (you'll need to implement this)
      product = Product.find(product_id)
    
      # Add the product to the user's cart (you'll need to implement this)
      user.cart.add_product(product, quantity)
    
      # Save the cart
      user.cart.save
    
      head :no_content
    end
    # DELETE /carts/remove_item
    def remove_item
      # Implement logic to remove an item from the user's cart
    end
  
    # Implement other cart-related actions as needed
  end
  
