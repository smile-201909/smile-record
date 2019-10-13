class UsersController < ApplicationController
  def index
  end

  def edit
    @user =current_user
  end

  def update
  end

  def show
    @user =User.find(params[:id])
  end

  def destroy
  end

  private

  def user_params
    params.require(:user).permit(:name, address_attributes:[:id, :post, :a_address, :phone])
  end

end
