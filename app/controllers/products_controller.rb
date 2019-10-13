class ProductsController < ApplicationController
  def index
  end

  def show
  end

  def new
    @products = Product.new
    @artists = Artist.new
    @genres = Genre.new
    @labels = Label.new
    @arrivails = Arrival.new
  end

  def create
  end

  def edit
  end

  def update
  end

  def destroy
  end
end
