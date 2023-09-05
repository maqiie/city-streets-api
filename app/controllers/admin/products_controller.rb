
class Admin::ProductsController < ApplicationController
  before_action :authenticate_admin!
  before_action :find_product, only: [:edit, :update, :destroy]



  
  def index
    @products = Product.all
  end

  def new
    @product = Product.new
  end

  
  def create
    @product = Product.new(product_params)
    if @product.save
      render json: { message: 'Product was successfully created.', product: @product }, status: :created
    else
      render json: { errors: @product.errors.full_messages }, status: :unprocessable_entity
    end
  end
  
  

  def edit
  end

  def update
    if @product.update(product_params)
      redirect_to admin_products_path, notice: 'Product was successfully updated.'
    else
      render :edit
    end
  end

  def destroy
    if @product.destroy
      render json: { message: 'Product was successfully deleted.' }, status: :ok
    else
      render json: { error: 'Failed to delete product.' }, status: :unprocessable_entity
    end
  end
  
  def destroy_all
    if Product.delete_all
      render json: { message: 'All products were successfully deleted.' }, status: :ok
    else
      render json: { error: 'Failed to delete all products.' }, status: :unprocessable_entity
    end
  end
  

  private

  def find_product
    @product = Product.find(params[:id])
  end

  def product_params
    params.require(:product).permit(:name, :description, :price, :image_url, :shoe_type, :shoe_design, :gender, :style, :brand_id)
  end
end



private

  def authenticate_admin!
    # Check if the current user is an admin or raise an error
    unless current_user&.admin?
      render json: { error: 'Unauthorized' }, status: :unauthorized
    end
  end