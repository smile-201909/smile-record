# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)



# coding: utf-8



Artist.create(:artist_name => '安室奈美恵')

Genre.create(:genre_name => 'JPOP')

Label.create(:label_name => 'レーベル１')



# 管理者ログイン情報
Administrator.create(:email => 'example@admin.com', :password => '000000')



# エンドユーザのログインデータ１００人分



# 商品データ１００個分
if Rails.env == "development"
  100.times do |i|
    Product.create!(:artist_id=>1, :genre_id=>1, :label_id=>1,  :product_name=> "アルバム" + (i + 1).to_s , :stock_amount=>i + 1, :status=>0, :price=> i + 1)
    Arrival.create!(:product_id=>i + 1, :arrival_amount=> i + 1)
    Disc.create!(:product_id=>i + 1, :disc_num=>i + 1, :disc_name=>"ディスク#{i + 1}")
    Song.create!(:disc_id=>i + 1, :song_num=>i + 1, :song_name=>"ソング#{i + 1}")
  end
end
