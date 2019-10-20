class Administrators::ArrivalsController < ApplicationController
  def index
  end

  def show
    @product = Product.find(params[:id])
    # @artist     = Product.find_by(
    @stock     = Stock.find(params[:product_id])
  end

  def new
  end

  def create
  end
end
