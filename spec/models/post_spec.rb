require "rails_helper"

RSpec.describe Post, type: :model do
  describe "#validation" do
    # テスト全体で使うユーザーを準備
    let(:user) {
      User.create(email: "test@example.com", password: "password",
                  password_confirmation: "password")
    }

    context "正常系" do
      it "必要な情報が入力されている場合、保存に成功すること" do
        post = Post.new(title: "テスト", content: "テスト", mood: "⭕️", user: user)
        expect(post).to be_valid # 有効であることを確認
      end

      it "タイトルが50文字の場合、保存に成功すること" do
        post = Post.new(title: "あ" * 50, content: "テスト", mood: "⭕️", user: user)
        expect(post).to be_valid 
      end

      it "内容が500文字の場合、保存に成功すること" do
        post = Post.new(title: "テスト", content: "あ" * 500, mood: "⭕️", user: user)
        expect(post).to be_valid
      end
    end

    context "異常系" do
      it "タイトルが空欄の場合、エラーが表示されること" do
        post = Post.new(title: "", content: "テスト", mood: "⭕️", user: user)
        post.valid?
        expect(post.errors.full_messages).to eq ["タイトルを入力してください"]
      end

      it "気分が選択されていない場合、エラーが表示されること" do
        post = Post.new(title: "テスト", content: "テスト", mood: "", user: user)
        post.valid?
        expect(post.errors.full_messages).to eq ["気分を選択してください"]
      end
       
      it "内容が空欄の場合、エラーが表示されること" do
        post = Post.new(title: "テスト", content: "",  mood: "⭕️", user: user)
        post.valid?
        expect(post.errors.full_messages).to eq ["内容を入力してください"]
      end

      it "タイトルが51文字の場合、エラーが表示されること" do
        post = Post.new(title: "あ" * 51, content: "テスト", mood: "⭕️", user: user)
        post.valid?
        expect(post.errors.full_messages).to eq ["タイトルを50文字以下で入力してください"]
      end

      it "内容が501文字の場合、エラーが表示されること" do
        post = Post.new(title: "テスト", content: "あ" * 501, mood: "⭕️", user: user)
        post.valid?
        expect(post.errors.full_messages). to eq ["内容を500文字以下で入力してください"]
      end
    end
  end
end