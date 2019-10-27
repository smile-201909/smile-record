class Administrators::ArrivalsController < ApplicationController
  before_action :authenticate_administrator!

  def index
    @arrivals = Arrival.where.not(arrival_amount: 0).page(params[:page]).per(20).order(created_at: :desc)
    render 'arrivals/index'
  end
  def show
    @product = Product.find(params[:id])
    @arrivals = @product.arrivals.where.not(arrival_amount: 0).page(params[:page]).per(20).order(created_at: :desc)
    render 'arrivals/index'
  end

  def new
  end

  def create
  end
end
