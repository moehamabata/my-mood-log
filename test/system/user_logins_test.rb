require "application_system_test_case"

class PostTest < application_system_test_case
  test "トップページに挨拶が表示されること" do
    visit root_url
    assert_text "こんにちは！Railsの世界へようこそ"
  end
end