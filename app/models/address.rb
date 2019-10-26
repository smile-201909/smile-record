class Address < ApplicationRecord

	acts_as_paranoid

	belongs_to :user

	validates :post, presence: true

  	validates :a_address, presence: true

  	validates :phone, presence: true



end