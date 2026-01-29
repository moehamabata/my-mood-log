require "application_system_test_case"

class UserLoginsTest < ApplicationSystemTestCase
  test "トップページに挨拶が表示されること" do
    # 1. トップページ（http://localhost:3000）にアクセスする
    visit root_url

    # 2. 画面内に「こんにちは!」という文字があるかチェックする
    assert_text "こんにちは!Railsの世界へようこそ"
  end
end