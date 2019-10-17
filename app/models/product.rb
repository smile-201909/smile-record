class Product < ApplicationRecord
	has_many :cart_products
	has_one :stock
	has_many :carts, through: :cart_products
end
