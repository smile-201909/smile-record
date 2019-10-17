class GenresController < ApplicationController


  def new
  	@genre = Genre.new
    render layout: false #application.html.erbを適用しない
  end

  def create
    #ここに”if current管理者"の記述が入る
  	@genre = Genre.new(params[:id])
  	@genre.save
  	redirect_to new_product_path
  end

  def update
    #ここに”if current管理者"の記述が入る
    #もしかして今のところはupdate必要ない...？編集機能がないため。10/16
  end

end
