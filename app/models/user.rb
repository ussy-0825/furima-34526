class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  validates :password, format: { with: /\A(?=.*?[a-z])(?=.*?\d)[a-z\d]{6,}\z/, message: 'Include both letters and numbers' }

  with_options presence: true do
    validates :nickname, :birthday
    validates :last_name, :first_name, format: { with: /\A[ぁ-んァ-ン一-龥]/, message: 'Full-width characters' }
    validates :last_name_kana, :first_name_kana, format: { with: /\A[ァ-ヶー－]+\z/, message: 'Full-width katakana characters' }
  end
end
