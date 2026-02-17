require 'rails_helper'

RSpec.describe "Posts", type: :request do
let(:user){User.create(email:'test@example.com',password:'password',
password_confirmation:'password')}
let!(:post_item){Post.create(
title:'初期タイトル',content:'初期内容',mood:'普通',user:user)}

describe "Post CRUDテスト"do
describe "GET/posts"do
it "正常にレスポンスを返すこと"do
get posts_path
expect(response).to have_http_status(:success)
end
end

end
end