class ReceiptsController < ApplicationController

 def index
 end


 def new
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
