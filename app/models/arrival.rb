class Arrival < ApplicationRecord
	belongs_to :product
	validates :arrival_amount, numericality:{only_integer:true, greater_than_or_equal_to:0}

	validates :arrival_amount, presence: true
end
