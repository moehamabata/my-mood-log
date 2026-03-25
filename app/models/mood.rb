class Mood < ApplicationRecord
  MOOD_TYPES = [
    "happy",
    "sad",
    "angry",
    "tired",
    "excited",
    "anxious",
    "normal",
  ]

  # バリデーション（カラム名を feeling, note に合わせる）
  validates :feeling, presence: true
  validates :note, length: { maximum: 50 }
end
