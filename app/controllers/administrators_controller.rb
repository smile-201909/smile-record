class AdministratorsController < ApplicationController
  before_action :authenticate_administrator!
  def index
    @users = User.search(params[:search]).page(params[:page]).per(30)
  end

  def show
    @user      = User.find(params[:id])
    @address = Address.find_by(user_id: @user.id)
    @receipts = Receipt.order(created_at: :desc).page(params[:page]).per(5)

    render "user/edit"
  end

  def edit
    @user      = User.find(params[:id])
  end

  def update
    @user = User.find(params[:id])
    @user.update(user_params)
    redirect_to administrators_user_path(@user.id)
  end

  def top
    @receipts = Receipt.order(created_at: :desc).page(params[:page]).per(10)
    search_date = DateTime.now
    @dayreceipts           = Receipt.where(created_at: search_date.in_time_zone.all_day)
    @monthreceipts       = Receipt.where(created_at: search_date.in_time_zone.all_month)
    @yearreceipts          = Receipt.where(created_at: search_date.in_time_zone.all_year)
    @day_total_price     = @dayreceipts.sum(:total_price)
    @month_total_price = @monthreceipts.sum(:total_price)
    @year_total_price    = @yearreceipts.sum(:total_price)
    @total_price             = @receipts.sum(:total_price)

  end


  private
  def user_params
    params.require(:user).permit(:family_name,
                                       :first_name,
                                       :family_name_kana,
                                       :first_name_kana,
                                       :email,
                                        addresses_attributes: [:id, :post,
                                                                   :a_address,
                                                                   :phone,
                                                                   :pulldown_name])
  end

  def receipt_params
    params.require(:receipt).permit(:status)
  end


end
