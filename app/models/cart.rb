class Cart < ApplicationRecord
	has_many :cart_items
	has_many :products, through: :cart_products
	belongs_to :user
end
