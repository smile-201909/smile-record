class ArtistsController < ApplicationController
  def new
  	@artist = Artist.new
  	render layout: false #application.html.erbを適用しない
  end

  def create
  	@artist = Artist.new(artist_params)
  	#ここに”if current管理者"の記述が入る
  	@artist.save
  	redirect_to new_product_path
  end
end
