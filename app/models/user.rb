class User < ActiveRecord::Base
  authenticates_with_sorcery!
  has_many :users_hobbies
  has_many :hobbies, through: :users_hobbies
  
  validates :password, length: { minimum: 8 }, if: -> { new_record? || changes[:crypted_password] }
  validates :password, confirmation: true, if: -> { new_record? || changes[:crypted_password] }
  validates :password_confirmation, presence: true, if: -> { new_record? || changes[:crypted_password] }

  validates :email, uniqueness: true
  VALID_EMAIL_REGEX =  /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i #メールアドレスフォーマットの検証（完璧な正規表現ではない）
  validates :email, format: { with: VALID_EMAIL_REGEX }
end
