class ProductsController < ApplicationController
  def index
  end

  def show
    @product = Product.find(params[:id])
  end

  def new
    @product = Product.new
    @disc = @product.discs.build
    @song = @disc.songs.build
  end

  def create
    @product = Product.new
    #ここに”if currentおっちゃん"の記述が入る
    @product.save
    redirect_to product_path(@product)
  end

  def edit
  end

  def update
    #ここに”if currentおっちゃん"の記述が入る
  end

  def destroy
  end

#   def search
#     @posts = Post.search(params[:search]) #params[:search]の値はmodelのSearch.rbを参照する
#   end



private
def product_params
  params.require(:product).permit(:produt_name, :product_image, :status)




end


