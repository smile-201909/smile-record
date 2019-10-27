class AddressesController < ApplicationController
  before_action :correct_user, only: [:edit, :update ]
  def correct_user
    @user = User.find(params[:user_id])
    unless @user==current_user || administrator_signed_in?
      redirect_to user_addresses_path(current_user.id)
    end
  end
  def index
    @user = User.find(params[:user_id])
  end
  def edit
    @user = User.find(params[:user_id])
    @address = Address.find(params[:id])
  end

  def update
    @user =User.find(params[:user_id])
    @address =Address.find(params[:id])
    if @address.update(address_params)
      redirect_to user_addresses_path(@user.id)
    else
      render 'addresses/edit'
    end 
  end

  def destroy
    user = current_user
    address =Address.find(params[:id])
    address.destroy
    redirect_to user_addresses_path(user)
  end
  def new
    @user = User.find(params[:user_id])
    @address =Address.new
  end
  def create
    @address = current_user.addresses.new(address_params)
    if @address.save
      redirect_to user_addresses_path
    else
      render 'addresses/new'
    end
  end
  private

  def address_params
    params.require(:address).permit(:id, :family_name,:first_name,:family_name_kana, :first_name_kana, :post, :a_address, :phone, :user_id, :pulldown_name)
  end
end



