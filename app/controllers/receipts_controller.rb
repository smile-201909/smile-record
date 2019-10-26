class ReceiptsController < ApplicationController

 def index
 end


 def new
   @user = current_user
   @receipt = Receipt.new
   @addresses = @user.addresses.all

   # @cart = @user.cart
   @cart_items = @user.cart.products.all
   sum= 0
   @cart_items.each do |item|
     item_amount = item.cart_items.first.product_amount
     sum += item.price*item_amount
   end
   @total = (sum*1.1)+500
   @tax = sum*0.1

 end


 def create
   r = Receipt.new(receipt_create_params)
   r.user_id = current_user.id
   r.purchaser_family_name = current_user.family_name
   r.purchaser_first_name = current_user.first_name
   r.postage = 500
   r.status = 0
   r.settlement = params[:receipt][:settlement].to_i
   r.save

   current_user.cart.cart_items.each do |a|
     i = ReceiptItem.new
     i.receipt_id = r.id
     i.product_name = a.product.product_name
     i.product_image_id = a.product.product_image_id
     i.price = a.product.price
     i.product_amount = a.product_amount
     i.save!
     sa = Product.find(a.product_id)
     sa.stock_amount = sa.stock_amount - a.product_amount
     sa.save
   end
   current_user.cart.cart_items.destroy_all
   redirect_to thanks_path
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

 def receipt_create_params
   params.require(:receipt).permit(:total_price,
                                                  :delivery_address,
                                                  :post)
 end

 def update_params
   params.require(:product).permit(:stock_amount)
 end
end
