class Product < ApplicationRecord
	belongs_to :artist
	belongs_to :genre
	belongs_to :label
	has_one :stock
	has_many :discs
	has_many :cart_products
	accepts_nested_attributes_for :discs


    attachment :product_image

	enum status: { 販売中: 0, 販売停止中: 1 } #statusはproductテーブルにあるカラム。



	 def self.search(search) #productコントローラのparams[:search]と繋がっている。
      return Post.all unless search
      Post.where(['content LIKE ?', "%#{search}%"])
      #whereで検索した %#{search}% の値を上の(search)に返す→コントローラにいく。
    end
end
