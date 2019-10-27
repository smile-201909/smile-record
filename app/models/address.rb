class Address < ApplicationRecord

	acts_as_paranoid

	belongs_to :user

	validates :family_name, presence: true

	validates :first_name, presence: true

	validates :family_name_kana, presence: true

	validates :first_name_kana, presence: true

	validates :pulldown_name, presence: true

	validates :post, presence: true

  	validates :a_address, presence: true

  	validates :phone, presence: true



end