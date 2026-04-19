# ApplicationRecordをPostクラスに継承させる
class Post < ApplicationRecord
  belongs_to :user # 日記は一人のユーザーに属している

  MOOD_LABELS = {
    "excited" => "✨ 楽しい",
    "happy" => "🍀 幸せ",
    "normal" => "☁️ 普通",
    "tired" => "🔥 元気",
    "anxious" => "🌙 寂しい",
    "sad" => "😢 悲しい",
    "angry" => "😠 怒り"
  }.freeze

  # タイトルの空文字は保存不可で入れることが必須。50文字以下
  validates :title, presence: true, length: { maximum: 50 }
  # 本文の空文字は保存不可、文字制限は500文字以下
  validates :content, presence: true, length: { maximum: 500 }
  # moodのバリデーション追加"
  validates :mood, presence: true

  # セレクトボックク用のオプション配列を生成
  def self.mood_options
    MOOD_LABELS.map { |value, label| [label, value] }
  end
end