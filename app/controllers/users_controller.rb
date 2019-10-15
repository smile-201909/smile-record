class UsersController < ApplicationController
  def index
  end

  private

  def user_params
    params.require(:user).permit(:name, address_attributes:[:id, :post, :a_address, :phone])
  end

end
