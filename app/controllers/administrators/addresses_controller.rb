class Administrators::AddressesController < ApplicationController
  before_action :authenticate_administrator!

  def index
    @user = User.find(params[:user_id])
    @addresses = Address.all
    render "addresses/index"
  end


  def edit
    @user = User.find(params[:user_id])
    @address = Address.find(params[:id])
    render "addresses/edit"
  end

  def update
    @user = User.find(params[:user_id])

    if  @user.update(address_params)
      flash[:notice] = "successfully "
      redirect_to administrators_user_addresses_path(@user.id)
    else
      flash[:notice] = "error "
      render 'addresses/edit'
    end
  end


  def destroy
    user = User.find(params[:user_id])
    address =Address.find(params[:id])
    address.destroy
    redirect_to administrators_user_addresses_path(user.id)
  end

  private

  def address_params
    params.require(:address).permit(:id, :family_name,:first_name,:family_name_kana, :first_name_kana, :post, :a_address, :phone, :user_id, :pulldown_name)
  end
end
