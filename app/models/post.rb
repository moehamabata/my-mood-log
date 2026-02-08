class Post < ApplicationRecord
# ApplicationRecordをPostクラスに継承させる
  belongs_to :user
  # 日記は一人のユーザーに属している
  validates :title, presence: true, length: { minimum: 1, maximum: 50 }, uniqueness: true
  # タイトルの空文字は保存不可で入れることが必須。文字制限は3文字以上、50文字以下
  validates :content, presence: true, length: { maximum: 500 }
  # 本文の空文字は保存不可、文字制限は500文字以下
  validates :mood, presense : true,
  # moodのバリデーション追加"
end