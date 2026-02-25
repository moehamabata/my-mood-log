class User < ApplicationRecord #UserクラスにApplicationRecordを継承させる
  
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  #ログインしている人の投稿一覧を簡単に出せるようになる
  has_many :posts, dependent: :destroy
end