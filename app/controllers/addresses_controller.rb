class AddressesController < ApplicationController

  def index
    @user = current_user
    @addresses = Address.all
  end


  def edit
    @user = current_user
  end

  # def update
  #   @user = User.find(params[:id])
  #   if  @user.update(user_params)
  #     flash[:notice] = "successfully "
  #     redirect_to user_path(@user.id)
  #   else
  #     flash[:notice] = "error "
  #     render :edit
  #   end
  # end

  def show
  	@user =User.find(params[:id])
    @address =Address.new

  end

  def destroy
    user = current_user
    address =Address.find(params[:id])
    address.destroy
    redirect_to user_addresses_path(user)


  end

  def new
    @user = current_user
    @address =Address.new

  end

  def create
    @address = current_user.addresses.new(address_params)
    @address.save
    redirect_to user_addresses_path
  end


  private

  def address_params
    params.require(:address).permit(:id, :family_name,:first_name,:family_name_kana, :first_name_kana, :post, :a_address, :phone, :user_id)
  end
end


