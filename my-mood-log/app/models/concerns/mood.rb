class Mood < ApplicationRecord
  validates :tittle, lenght: { maximum: 50 }
  validates :content, presence: true
end