require 'rails_helper'

RSpec.describe "Posts", type::system do

# テスト用のユーザーを準備（ログインが必要な場合）
let(:user){User.create(email:'test@example.com',password:'password'
password_confirmation:'password')}

it "ブラウザが立ち上がり、投稿の詳細が表示されること"do
# テスト用のデータを作る
post_item=Post.create!(title:"RSpec入門",content:"System Specのテスト",
mood:"楽しい",user:user)

end
end