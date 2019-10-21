class CartsController < ApplicationController
	def index
		@cart_items = current_user.cart.products.all
	end
	
	def create
		# cart_item = CartItem.new(cart_item_params)
		# cart_item.cart_id = current_user.cart.id


		# serch_item = current_user.cart.cart_items.find_by(product_id: params[:product_id])
		# if cart_item.product_id == serch_item.product_id
		# cart_items = CartItem.where("cart_id = current_user.cart.id")
		# if cart_items.product_id == cart_item.product_id

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

end
