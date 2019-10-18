class Stock < ApplicationRecord
	belongs_to :product
	has_many :arrivals, dependent: :destroy
	accepts_nested_attributes_for :arrivals, allow_destroy: true
end
