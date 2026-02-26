require 'rails_helper'

RSpec.describe "Posts", type: :system do
let(:user) do
User.create(
email: 'test@example.com',
password: 'password',
password_confirmation: 'password'
)
end

it "投稿の詳細が表示されること" do

post_item = Post.create!(
title: "RSpec入門",
content: "System Specのテスト",
mood: "楽しい",
user: user
)

# 投稿の詳細ページに実際にアクセスする命令
visit post_path(post_item)

# 画面に期待する文字があるか確認
expect(page).to have_content("RSpec入門")
expect(page).to habe_content("System Specのテスト")

# 動きを目で確認するために5秒間ブラウザを止める
sleep 5

end
end