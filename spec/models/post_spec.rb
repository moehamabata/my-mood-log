require 'rails_helper'

RSpec.describe Post,type: :model do
describe 'バリデーションのテスト'do
# テスト全体で使うユーザーを準備
let(:user) {User.create(email:'test@example.com',password:'password',
password_confirmation:'password')}

end
end