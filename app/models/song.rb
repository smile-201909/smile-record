class Song < ApplicationRecord
	belongs_to :disc
	validates :song_num, numericality:{only_integer:true, greater_than:0}
	[:song_num, :song_name].each do |v|
		validates v, presence: true
	end
end
