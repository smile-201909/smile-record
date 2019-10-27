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
		if user_signed_in?
			cart_item = current_user.cart.cart_items.find_or_initialize_by(product_id: params[:cart_item][:product_id])
			# .find_or_initialize_byは、対象から()の条件を満たすレコードを探してくる。見つからなければレコードを作る直前で止まる。
			if cart_item.new_record?#initializeされた場合
				cart_item.product_amount = params[:cart_item][:product_amount].to_i
			elsif cart_item.product_amount.to_i + params[:cart_item][:product_amount].to_i > cart_item.product.stock_amount.to_i
				#findされて、すでにカート内に入っていた数量とカートに入れようとしている数量の合計が、商品の在庫数を超える場合
				flash[:amount_over] = "商品の在庫数を超えてカートに追加することはできません。"
			else
				cart_item.product_amount += params[:cart_item][:product_amount].to_i
			end
			cart_item.save!
			redirect_to carts_path
		else
			redirect_to new_user_session_path
		end
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

	def update_params
		params.permit(cart_items: [:product_amount])[:cart_items]
	end

end
