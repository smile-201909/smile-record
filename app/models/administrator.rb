class Administrator < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

   # def day_total_price
   #   receipts  = Receipt.where(created_at: search_date.in_time_zone.all_day)
   #   total_price = 0
   #   receipts.each do |receipt|
   #     total_price += receipt.total_price
   #   end
   # end
end
