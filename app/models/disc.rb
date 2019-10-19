class Disc < ApplicationRecord
	belongs_to :product
	has_many :songs
	accepts_nested_attributes_for :songs, reject_if: :all_blank, allow_destroy: true #cocoon。songsも同時にデータ作成(保存)
	                                                             #↑ discが消えたら、songsも消える(product_paramsに関係有)
end
