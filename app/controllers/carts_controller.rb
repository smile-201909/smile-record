class CartsController < ApplicationController
	@carts = Cart.all
end
