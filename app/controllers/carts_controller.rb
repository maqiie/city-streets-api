# app/controllers/carts_controller.rb

class CartsController < ApplicationController
    before_action :authenticate_user!
  
    # GET /carts
    def show
      @cart = current_user.cart
      render json: @cart
    end
  
    # POST /carts/add_item
    def add_item
      # Implement logic to add an item to the user's cart
    end
  
    # DELETE /carts/remove_item
    def remove_item
      # Implement logic to remove an item from the user's cart
    end
  
    # Implement other cart-related actions as needed
  end
  
