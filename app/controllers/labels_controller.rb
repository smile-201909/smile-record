class LabelsController < ApplicationController


　def new
	@label = Label.new
  render layout: false #application.html.erbを適用しない
  end

  def create
  	#ここに”if currentおっちゃん"の記述が入る
  	@label = Label.new(params[:id])
  	@label.save
  	redirect_to new_product_path
  end

  def update
  	#ここに”if currentおっちゃん"の記述が入る
  	#もしかして今のところはupdate必要ない...？編集機能がないため。10/16
  end
end
