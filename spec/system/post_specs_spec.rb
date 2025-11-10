require 'rails_helper'

RSpec.describe "Posts", type: :system do
  before do
    driven_by(:rack_test)
  end

  it "投稿の詳細ページにタイトルと本文が表示される" do
    # テスト用のデータを作る
    post=Post.create!(title: "RSpec入門", content: "System Specのテスト")

    # その投稿のページにアクセス
    visit post_path(post)

    # ページに正しい内容があるか確認
    expect(page).to have_content("RSpec入門")
    expect(page).to have_content("System Specのテスト")
  end
end