class ProductsController < ApplicationController
  def index
    @products = Product.all
  end

  def show
    
  end

  def new
    @product = Product.new
  end

  def create
    @product = Product.new(product_params)
    @product.save
    redirect_to products_path
  end

  def edit
  end

  def update
  end

  def destroy
  end

  private
  def product_params
    params.require(:product).permit(:product_name, :price)
  end
end
