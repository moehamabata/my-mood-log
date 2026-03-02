class User < ApplicationRecord #UserクラスにApplicationRecordを継承させる
  
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  #ログインしている人の投稿一覧を簡単に出せるようになる
  has_many :posts, dependent: :destroy
  VALID_EMAIL_REGEX = /\A[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,}\z/

  validates :email, presence: true, format: { with: VALID_EMAIL_REGEX }
end