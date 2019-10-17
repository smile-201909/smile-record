class Receipt < ApplicationRecord
	has_many :receit_items
	belongs_to :user
end
