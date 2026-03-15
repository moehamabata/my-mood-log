FactoryBot.define do
  factory :post do
    title { "テストタイトル" }
    content { "テスト本文" }
    mood { "元気" }
    # mood など、もしマイグレーションで「null: false」にしている項目があればここに追加
    association :user
  end
end