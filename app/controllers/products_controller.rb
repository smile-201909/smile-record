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
    @arrival = @product.arrivals.build #子のarrivalsも同時に保存
    @disc = @product.discs.build #cocoon 子のdiscsも同時に保存
    @song = @disc.songs.build #cocoon 孫のsongsも同時に保存
  end

  def create
    product = Product.new(product_params)
    #ここに”if current管理者"の記述が入る
    product.save
    redirect_to products_path
  end

  def edit
  end

  def update
    #ここに”if current管理者"の記述が入る
  end

  def destroy
    @product = Product.find(params[:id])
    @product.destroy
    redirect_to products_path
  end

  def search
    @products = Product.search(params[:search]) #params[:search]の値はモデルのSearch.rbを参照する
  end



  private
  def product_params
    #（下2行は、cocoonの記述。）
    #上の行から順番に躓いた点
    #.permit内には、artist_id等も忘れずに書く。←permit内には送信したい値のカラムを全部書く！
    #
    #
    #discs_attrubutes:[:id(cocoon必須), :カラム名, :カラム名, :done. :_destroy(=アソシエーションしてるproductが消えた時に(モデルで定義済 allow_destroy)、discsも消去]
    #songs_attributes:[:id(cocoon必須), :カラム名, :カラム名,:_destroy(=アソシエーションしてるdiscsが消えた時に(モデルで定義済 allow_destroy)、songsも消去)]
    params.require(:product).permit(:product_name, :product_image, :status, :price, :artist_id, :genre_id, :label_id,
        stock_attributes:[ :stock_amount ],
        arrivals_attributes:[ :arrival_amount ],
        discs_attributes: [:id, :disc_num, :disc_name, :done, :_destroy,
          songs_attributes: [:id, :song_num, :song_name, :_destroy]])
  end


end


