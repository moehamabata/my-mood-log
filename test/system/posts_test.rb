require "application_system_test_case"

#1 大文字に修正
class PostTest < ApplicationSystemTestCase
  test "トップページが表示される" do
    #2 今動く root_url に変更
    visit root_url

    #3 今表示されているはずの文字に変更
    assert_text "こんにちは！Railsの世界へようこそ"
  end
end