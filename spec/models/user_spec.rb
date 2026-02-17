require 'rails_helper'

RSpec.describe User, type: :model do
describe'バリデーションのテスト'do
context'保存に成功する場合'do
it 'メールアドレスとパスワードがあれば保存できること'do
user=FactoryBot.build(:user)
expect(user).to be_valid
end
end

end
end