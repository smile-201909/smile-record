class Administrators::AddressesController < ApplicationController

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
      render :edit
    end
  end

  def show
  	@user =User.find(params[:user_id])
    @address =Address.new

  end

  def destroy
    user = User.find(params[:user_id])
    address =Address.find(params[:id])
    address.destroy
    redirect_to administrators_user_addresses(user.id)


  end

  def new
    @user = User.find(params[:user_id])
    @address =Address.new
    render "addresses/new"
  end

  def create
    @address = current_user.addresses.new(address_params)
    @address.save
    redirect_to user_addresses_path
  end


  private

  def address_params
    params.require(:address).permit(:id, :family_name,:first_name,:family_name_kana, :first_name_kana, :post, :a_address, :phone, :user_id, :pulldown_name)
  end
end
