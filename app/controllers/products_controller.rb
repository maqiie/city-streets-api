# app/controllers/products_controller.rb

class ProductsController < ApplicationController
    before_action :authenticate_user!, only: [:create]
  
    # GET /products
    def index
      @products = Product.all
      render json: @products
    end
    def men
        @products = Product.where(gender: 'Men')
        render :index  # Assuming you have an index view for listing products.
      end
    
      def women
        @products = Product.where(gender: 'Women')
        render :index
      end
    
    # GET /products/1
    def show
      @product = Product.find(params[:id])
      render json: @product
    end
  
    # POST /products
    # def create
    #   @product = Product.new(product_params)
  
    #   if @product.save
    #     render json: @product, status: :created
    #   else
    #     render json: @product.errors, status: :unprocessable_entity
    #   end
    # end
  
    private
  
    def product_params
      params.require(:product).permit(:name, :description, :price, :image_url, :shoe_type, :shoe_design)
    end
  end
  