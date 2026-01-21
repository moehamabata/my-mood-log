require "application_system_test_case"

class PostTest < application_system_test_case
  test "投稿を作成できる" do
    visit posts_path

    click_on "新規投稿"

    fill_in "Title", with: "テスト投稿"
    fill_in "Content", with: "これはsystemテストです"

    click_on "投稿する"

    assert_text "投稿できました！"
    assert_text "テスト投稿"
  end
end