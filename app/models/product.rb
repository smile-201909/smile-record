class Product < ApplicationRecord
	belongs_to :artist
	belongs_to :genre
	belongs_to :label

	has_many :discs
	accepts_nested_attributes_for :discs, reject_if: :all_blank, allow_destroy: true  #cocoon。discsも同時にデータ作成(保存)
	                                                             # ↑ productが消えたら、discsも消える(product_paramsに関係有)
	has_many :arrivals, dependent: :destroy
	accepts_nested_attributes_for :arrivals, reject_if: :all_blank, allow_destroy: true

	has_many :cart_items, dependent: :destroy
	has_many :carts, through: :cart_items

    attachment :product_image #refile用の記述

	enum status: { 販売中: 0, 販売停止中: 1 } #statusはproductテーブルにあるカラム。

	default_scope -> { order(created_at: :desc) }
	#:descでidの降順（新着順）となる

	def self.search(search)#productコントローラのparams[:search]と繋がっている。
		if search
			Product.where(['product_name LIKE ?', "%#{search}%"])#whereで検索した %#{search}% の値を上の(search)に返す→コントローラにいく。
	        # %#{search}% は、Productモデル(データベース)のプロパティ(SQL,あいまい検索)
		else
			Product.all #検索ワードがないときは全データ表示
	    end

    end





end
