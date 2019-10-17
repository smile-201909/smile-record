class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
  :recoverable, :rememberable, :validatable

  has_many :addresses, dependent: :destroy
  has_many :receipts
  has_one :cart
  accepts_nested_attributes_for :addresses

  acts_as_paranoid

end
