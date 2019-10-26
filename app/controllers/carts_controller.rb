class CartsController < ApplicationController
	def index
		@cart_items = current_user.cart.cart_items.all
		sum = 0
		@cart_items.each do |item|
			item_amount = item.product_amount
			sum += item.product.price*item_amount
		end
		@total_price = sum


	end

	def create
		cart_item = current_user.cart.cart_items.find_or_initialize_by(product_id: params[:cart_item][:product_id])
		# .find_or_initialize_byは、対象から()の条件を満たすレコードを探してくる。見つからなければレコードを作る直前で止まる。
		if cart_item.new_record?#initializeされた場合
			cart_item.product_amount = params[:cart_item][:product_amount].to_i
		else#findされた場合
			cart_item.product_amount += params[:cart_item][:product_amount].to_i
		end
		cart_item.save!
		redirect_to carts_path
	end

	def update
		update_params.each do |id, product_amount|
		cart_item = CartItem.find(id)
		cart_item.update(product_amount)
		end
		redirect_to carts_path
	end

	def destroy
		cart_item = CartItem.find(params[:id])
	    cart_item.destroy
	    redirect_to carts_path
	end

	private
	def cart_item_params
		params.require(:cart_item).permit(:cart_id, :product_id, :product_amount)
	end
	def update_params
		params.permit(cart_items: [:product_amount])[:cart_items]
	end

end
