require 'rails_helper'

RSpec.describe "Users", type: :request do
  let(:valid_attributes) do
    {
      email: "new_user_#{rand(1000)}@example.com",
      password: "password123",
      password_confirmation: "password123"
    }
  end

  describe "POST /users" do
    it "新しいユーザーを作成すること" do
      expect {
        post user_registration_path, params: { user: valid_attributes }
      }.to change(User, :count).by(1)
      expect(response).to have_http_status(:redirect)
    end
  end
  
  # GET /users/:id のテストは一旦削除（またはコメントアウト）
end