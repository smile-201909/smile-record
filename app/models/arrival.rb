class Arrival < ApplicationRecord
	belongs_to :product
	validates :arrival_amount, numericality:{only_integer:true, greater_than:0}

	validates :arrival_amount, presence: true
end
