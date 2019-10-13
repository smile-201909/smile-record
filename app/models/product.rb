class Product < ApplicationRecord
	enum status: {
		販売中:1,販売停止中:2
	}

end
