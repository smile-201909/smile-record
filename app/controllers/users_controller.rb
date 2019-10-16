class UsersController < ApplicationController

	def index
	end

	def edit
		@user =User.find(params[:id])
		#find =PK
		@address =Address.find_by(user_id: @user.id)
		#find_by =カラム
	end

	def show
		@user =User.find(params[:id])
		#find =PK
		@address =Address.find_by(user_id: @user.id)
		#find_by =カラム
		#@address =Address.find(@user.id)
		#@address =User.find(@user.address_id)
	end

	def destroy
		user = User.find(params[:id])
		user.destroy
		redirect_to products_path
	end

	def update
		@user = User.find(params[:id])
		if	@user.update(user_params)
			flash[:notice] = "successfully "
			redirect_to user_path(@user.id)
		else
			flash[:notice] = "error "
			render :edit
		end
	end

	private

	def user_params
		params.require(:user).permit(:email,:family_name,:first_name,:family_name_kana, :first_name_kana, addresses_attributes:[:id, :post, :a_address, :phone, :_destroy, :pulldown_nama])
	end

end