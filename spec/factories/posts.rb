FactoryBot.define do
  factory :post do
    title { "テストタイトル" }
    content { "テスト本文" }
    mood { "happy" }
    association :user
  end
end