class Mood < ApplicationRecord
  validates :tittle, length: { maximum: 50}
  validates :content, presence: true
end