class ReceiptsController < ApplicationController

 def index
 end


 def new
   @user = current_user
   @receipt = Receipt.new
   @addresses = @user.addresses.all
   
   # @cart = @user.cart
   @cart_items = @user.cart.products.all

 end


 def create
 end


 def show
 end

 def update
   @receipt = Receipt.find(params[:id])
   @receipt.update(receipt_params)
   redirect_to administrators_top_path
 end

 private
 def receipt_params
   p = params.require(:receipt).permit(:status)
   p[:status] = params[:receipt][:status].to_i
   return p
 end
end
