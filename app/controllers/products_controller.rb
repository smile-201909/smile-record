class ProductsController < ApplicationController
  def index
  end

  def index
    @products = Product.all
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
    #ここに”if current管理者"の記述が入る
    @product.save
    redirect_to products_path
  end

  def edit
  end

  def update
    #ここに”if current管理者"の記述が入る
  end

  def destroy
  end

#   def search
#     @posts = Post.search(params[:search]) #params[:search]の値はmodelのSearch.rbを参照する
#   end



  private
  def product_params
    params.require(:product).permit(:product_name, :product_image, :status, :price,
      discs_attribuites: [:id, :description, :done, :_destroy,
        songs_attribuites: [:id, :description, :_destroy]])
  end


end


