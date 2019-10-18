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
    product = Product.new(product_params)
    #ここに”if current管理者"の記述が入る
    product.save!
    stock = Stock.new(product_id: product.id, stock_amount: params[:product][:stock][:stock_amount])
    stock.save!
    arrival = Arrival.new(stock_id: stock.id, arrival_amount: params[:product][:stock][:stock_amount])
    arrival.save!
    redirect_to products_path
  end

  def edit
  end

  def update
    
  end

  def destroy
    @product = Product.find(params[:id])
    @product.destroy
    redirect_to products_path
  end

#   def search
#     @posts = Post.search(params[:search]) #params[:search]の値はmodelのSearch.rbを参照する
#   end



  private
  def product_params
    params.require(:product).permit(:product_name, :product_image, :status, :price, :artist_id, :genre_id, :label_id,
      stock_attributes:[ :stock_amount ],
      arrivals_attributes:[ :arrival_amount ],
      discs_attributes: [:id, :disc_num, :disc_name, :done, :_destroy,
        songs_attributes: [:id, :song_num, :song_name, :_destroy]])
  end

end


