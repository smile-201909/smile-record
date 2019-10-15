class Product < ApplicationRecord
	belongs_to :artist
	belongs_to :genre
	belongs_to :label
	has_one :stock
	has_many :discs
end
