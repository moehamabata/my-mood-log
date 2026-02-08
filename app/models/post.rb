class Post < ApplicationRecord
# ApplicationRecordをPostクラスに継承させる
  validates :title, presence: true, length: { minimum: 3, maximum: 50 }, uniqueness: true
  # タイトルの空文字は保存不可で入れることが必須。文字制限は3文字以上、50文字以下
  validates :content, presence: true, length: { maximum: 500 }
  # 本文の空文字は保存不可、文字制限は500文字以下
end