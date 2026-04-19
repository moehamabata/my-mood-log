require 'rails_helper'

RSpec.describe "Posts", type: :system do
  let(:user) do
    User.create!(
      email: 'test@example.com',
      password: 'password123',
      password_confirmation: 'password123'
    )
  end

  let(:post_item) do
    Post.create!(
      title: "RSpec入門",
      content: "System Specのテスト",
      mood: "happy",
      user: user
    )
  end

  it "投稿の詳細が表示されること" do
    # ログイン
    visit new_user_session_path
    fill_in 'user[email]', with: user.email
    fill_in 'user[password]', with: 'password123'
    click_button 'ログイン'
    # ログイン後の画面が表示されるまでwait
    expect(page).to have_content("My Mood Log")

    # 投稿詳細へ
    visit post_path(post_item)

    expect(page).to have_content("RSpec入門")
    expect(page).to have_content("System Specのテスト")
  end

  it "ログアウトができること" do
    # ログイン処理を済ませる
    visit new_user_session_path
    fill_in 'user[email]', with: user.email
    fill_in 'user[password]', with: 'password123'
    click_button 'ログイン'
    expect(page).to have_content("My Mood Log")

    # ログアウトボタンを押す
    click_on 'ログアウト'

    expect(page).to have_current_path(new_user_session_path)
  end
end