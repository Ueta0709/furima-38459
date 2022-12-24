class User < ApplicationRecord
  
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  validates :nickname, presence: true
  validates :first_name, presence: true, format: { with: /\A[ぁ-んァ-ン一-龥]/ }
  validates :last_name, presence: true, format: { with: /\A[ぁ-んァ-ン一-龥]/ }
  validates :first_name_kana, presence: true, format: { with: /\A[ｧ-ﾝﾞﾟ]+\z/ }
  validates :last_name_kana, presence: true, format: { with: /\A[ｧ-ﾝﾞﾟ]+\z/ }
  validates :birthday, presence: true
  validates :encrypted_password, presence: true, confirmation: true, length: { minimum: 6 }, format: { with: /\A(?=.&#042;?[a-z])(?=.&#042;?\d)[a-z\d]+\z/i }
  validates :encrypted_password_confirmation, presence: true
  validates :email, presence: true, inclusion: { in: %w(@) }
  
end
