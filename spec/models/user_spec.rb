require "rails_helper"

RSpec.describe User, type: :model do
  describe "#validation" do
    context "正常系" do
      it "必要な情報がある場合、保存できること" do
        user = User.new(
          email: "test@example.com",
          password: "password123",
          password_confirmation: "password123",
        )
        expect(user).to be_valid
      end
    end

    context "異常系" do
      it "メールアドレスがない場合、エラーになること" do
        user = User.new(
          email: "",
          password: "password123",
          password_confirmation: "password123",
        )
        user.valid?
        expect(user.errors.full_messages).to include("Eメールを入力してください")
      end

      it "パスワードがない場合、エラーになること" do
        user = User.new(
          email: "test@example.com",
          password: "",
          password_confirmation: "password123",
        )
        user.valid?
        expect(user.errors.full_messages).to include("パスワードを入力してください")
      end

      it "パスワード（確認用）がない場合、エラーになること" do
        user = User.new(
          email: "test@example.com",
          password: "password123",
          password_confirmation: "",
        )
        user.valid?
        expect(user.errors.full_messages).to include("パスワード（確認用）とパスワードの入力が一致しません")
      end

      it "パスワードが5文字以下の場合、エラーになること" do
        user = User.new(
          email: "test@example.com",
          password: "123a1",
          password_confirmation: "123a1",
        )
        user.valid?
        expect(user.errors.full_messages).to include("パスワードを6文字以上で入力してください")
      end

      it "パスワードが英小文字だけの場合、エラーになること" do
        user = User.new(
          email: "test@example.com",
          password: "password",
          password_confirmation: "password",
        )
        user.valid?
        expect(user.errors.full_messages).to include("パスワードは半角英数字で入力してください")
      end

      it "パスワードが数字のみの場合、エラーになること" do
        user = User.new(
          email: "test@example.com",
          password: "1234567",
          password_confirmation: "1234567",
        )
        user.valid?
        expect(user.errors.full_messages).to include("パスワードは半角英数字で入力してください")
      end
    end
  end
end