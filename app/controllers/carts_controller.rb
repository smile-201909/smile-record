class CartsController < ApplicationController
	def index
		@cart_items = current_user.cart.products.all
	end
	
	def create
		
	end

	def update
		
	end

	def destroy

	end

end
