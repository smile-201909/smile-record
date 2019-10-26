class Administrators::ArrivalsController < ApplicationController
  def index
    @arrivals = Arrival.order(created_at: :desc).all
    render 'arrivals/index'
  end

  def show
    @product = Product.find(params[:id])
    @arrivals = @product.arrivals.order(created_at: :desc).all
    render 'arrivals/index'
  end

  def new
  end

  def create
  end
end
