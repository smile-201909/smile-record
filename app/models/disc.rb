class Disc < ApplicationRecord
	belongs_to :product
	has_many :songs, dependent: :destroy
	accepts_nested_attributes_for :songs, reject_if: :all_blank, allow_destroy: true #cocoon。songsも同時にデータ作成(保存)
																 #↑ discが消えたら、songsも消える(product_paramsに関係有)
	validates :disc_num, numericality:{only_integer:true, greater_than:0}
	[:disc_num, :disc_name].each do |v|
		validates v, presence: true
	end
end
