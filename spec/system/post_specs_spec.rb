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

end
end