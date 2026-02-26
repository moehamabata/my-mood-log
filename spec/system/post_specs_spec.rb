require 'rails_helper'

RSpec.describe "Posts", type: :system do
  let(:user) do
    User.create!(
      email: 'test@example.com',
      password: 'password',
      password_confirmation: 'password'
    )
  end

  let(:post_item) do
    Post.create!(
      title: "RSpec入門",
      content: "System Specのテスト",
      mood: "楽しい",
      user: user
    )
  end

  it "投稿の詳細が表示されること" do
    # ログイン
    visit new_user_session_path
    fill_in 'user[email]', with: user.email
    fill_in 'user[password]', with: user.password
    click_button 'Log in'

    # 投稿詳細へ
    visit post_path(post_item)

    expect(page).to have_content("RSpec入門")
    expect(page).to have_content("System Specのテスト")
  end
end