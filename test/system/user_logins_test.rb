require "application_system_test_case"

class PostsTest < ApplicationSystemTestCase
  test "visiting the index" do
    visit root_url
    assert_text "こんにちは!Railsの世界へようこそ"
  end
end