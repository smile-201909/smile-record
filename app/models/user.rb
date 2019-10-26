class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable

  acts_as_paranoid

  devise :database_authenticatable, :registerable,
  :recoverable, :rememberable, :validatable

  has_many :addresses, dependent: :destroy
  has_many :receipts
  has_one :cart
  accepts_nested_attributes_for :addresses

  validates :family_name, presence: true
  validates :family_name, format: { with: /\A[一-龥]+\z/ }

  validates :first_name, presence: true
  validates :first_name, format: { with: /\A[一-龥]+\z/ }

  validates :family_name_kana, presence: true
  validates :family_name_kana, format: { with: /\A[ァ-ヶー－]+\z/ }

  validates :first_name_kana, presence: true
  validates :first_name_kana, format: { with: /\A[ァ-ヶー－]+\z/ }

   def self.search(search)
     if search
       User.where(['email LIKE ?', "%#{search}%"])
     else
       User.all
     end
   end
end
