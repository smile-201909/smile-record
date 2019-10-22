class Administrators::ArrivalsController < ApplicationController
  def index
    @arrivals = Arrival.order(created_at: :desc).all
    render 'arrivals/index'
  end

  def show
    @product = Product.find(params[:id])
    @arrival = Arrival.find(params[:id])
    # @artist     = Product.find_by(
    render 'arrivals/show'
  end

  def new
  end

  def create
  end
end
