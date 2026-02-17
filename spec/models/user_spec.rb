require 'rails_helper'

RSpec.describe User, type: :model do
describe'バリデーションのテスト'do
context'保存に成功する場合'do
it 'メールアドレスとパスワードがあれば保存できること'do
user=User.new(email:'test@example.com',password'password:',password_confirmation:'password')
expect(user).to be_valid
end
end

end
end