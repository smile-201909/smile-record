class AdministratorsController < ApplicationController
  before_action :authenticate_administrator!
  def index
    @users = User.search(params[:search]).page(params[:page]).per(30)
  end

  def show
    @user      = User.find(params[:id])
    @address = Address.find_by(user_id: @user.id)
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
    search_date = DateTime.now
    @dayreceipts           = Receipt.where(created_at: search_date.in_time_zone.all_day)
    @monthreceipts       = Receipt.where(created_at: search_date.in_time_zone.all_month)
    @yearreceipts          = Receipt.where(created_at: search_date.in_time_zone.all_year)
    @receipts                 = Receipt.page(params[:page]).per(5)
    @day_total_price     = @dayreceipts.sum(:total_price)
    @month_total_price = @monthreceipts.sum(:total_price)
    @year_total_price    = @yearreceipts.sum(:total_price)
    @total_price             = @receipts.sum(:total_price)

    # @receipt                   =
    @receipt_items   = ReceiptItem.all
#一つ目の計
    # @receipt_total = ReceiptItem.all.sum(:price)
    # @tax_receipt_total = (@receipt_total*tax) - @receipt_total


#二つ目の計算
    # @total_price = 0
    # @receipt_items.each do |receipt_item|
    #   @total_price += receipt_item.price
    # end|


  end


    #
    # Receipt.where(created_at: search_date.in_time_zone.all_day)
    # Receipt.where(created_at: search_date.in_time_zone.all_month)
    # Receipt.where(created_at: search_date.in_time_zone.all_year)

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
