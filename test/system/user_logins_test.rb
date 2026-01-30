require "application_system_test_case"

class UserLoginsTest < ApplicationSystemTestCase
  test "トップページが表示されること" do
    # root_url は、あなたが bin/rails s で見ている最初のページのこと
    visit root_url 

    # 画面にこの文字があるか、ロボットに探させる
    assert_text "こんにちは!Railsの世界へようこそ"
  end
end