require`rails_helper` # Railsのテストに必要な設定ファイルを読み込む

RSpec.describe Post, type: :model do # Postモデルに関するテストを書いていく
describe`バリデーションのテスト`do # テストを分かりやすく整理するための見出し。「バリデーションについてチェックしていく」
let(:user) {FactoryBot.create(:user)} # テスト用のユーザーを一人、裏側で準備している

end
end