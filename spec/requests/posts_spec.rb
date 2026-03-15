require "rails_helper"

RSpec.describe "Posts", type: :request do
  let(:user) { create(:user) }
  let(:another_user) { create(:user) }
  let(:first_post) { create(:post, title: "初期タイトル", content: "初期内容", user_id: user.id) }
  let(:second_post) { create(:post, title: "二つ目の投稿", content: "二つ目の内容", user_id: user.id) }
  let(:another_user_post) { create(:post, user_id: another_user.id) }

  def sign_in(user)
    post user_session_path, params: { user: { email: user.email, password: user.password } }
  end

  describe "CRUDテスト" do
    describe "#index" do
      context "ログインしている場合" do
        before { sign_in user }
        it "0件の場合、投稿されていない旨のメッセージが表示されること" do
          get posts_path
          expect(response).to have_http_status(:success)
          expect(response.body).to include("My Mood Log") # 一覧画面が表示されていることを確認
          expect(response.body).to include("投稿がありません") # MEMO 0件の場合の処理を実装する
        end
        it "1件の場合、一覧画面が1件分表示されること" do
          first_post
          get posts_path
          expect(response).to have_http_status(:success)
          expect(response.body).to include("初期タイトル")
        end
        it "複数件の場合、一覧画面が表示されること" do
          first_post
          second_post
          get posts_path
          expect(response).to have_http_status(:success)
          expect(response.body).to include("初期タイトル")
          expect(response.body).to include("二つ目の投稿")
        end
        it "他の人の投稿は閲覧できないこと" do
          first_post
          another_user_post
          get posts_path
          expect(response).to have_http_status(:success)
          expect(response.body).to include("初期タイトル") # 自分の投稿は閲覧可能
          expect(response.body).not_to include("みちゃダメ！！！") # 他人の投稿は閲覧不可
        end
      end
      context "ログインしていない場合" do
        it "ログイン画面に戻されること" do
          get posts_path # トップページに移動する
          expect(response).to redirect_to(new_user_session_path)
        end
      end
    end

    describe "#show" do
      context "ログインしている場合" do
        before { sign_in user }
        it "投稿しているurlに遷移しようとすると、記事が閲覧できること" do
          get post_path first_post # 投稿詳細画面に移動する
          expect(response.body).to include("初期内容")
        end
        it "不正なurlに遷移しようとすると、一覧画面に戻されること" do
          invalid_post_id = 99999
          get post_path invalid_post_id
          expect(response).to redirect_to(posts_path)
        end
        it "他の人の投稿は閲覧できないこと" do
          get post_path another_user_post # 他に人の投稿画面に遷移しようとする
          expect(response).to redirect_to(posts_path)
          expect(flash[:alert]).to include("権限がありません")
        end
      end
      context "ログインしていない場合" do
        it "ログイン画面に戻されること" do
          get post_path first_post # 投稿詳細画面に遷移する
          expect(response).to redirect_to(new_user_session_path)
        end
      end
    end

    describe "#new" do
      context "ログインしている場合" do
        before { sign_in user }
        it "新規投稿画面に遷移できること" do
          get new_post_path
          expect(response).to have_http_status(:success)
          expect(response.body).to include("新しい日記")
        end
      end
      context "ログインしていない場合" do
        it "ログイン画面に戻されること" do
          get new_post_path
          expect(response).to redirect_to(new_user_session_path)
        end
      end
    end

    describe "#create" do
      before { sign_in user }
      let(:valid_params) {
        { post: {
          title: "新規タイトル",
          content: "新規テスト内容",
          mood: "普通",
          user: user,
        } }
      }
      it "必要な情報が入力されている場合、保存に成功し一覧画面に遷移すること" do
        expect {
          post posts_path, params: valid_params
        }.to change(Post, :count).by(1)
        expect(response).to redirect_to(posts_path) # 一覧画面にリダイレクトが行われたかを確認
        expect(flash[:notice]).to eq "投稿できました！"

        created_post = Post.last
        expect(created_post.title).to eq "新規タイトル" # 想定通りの値で保存されているかを検証
        expect(created_post.content).to eq "新規テスト内容"
        expect(created_post.mood).to eq "普通"
        expect(created_post.user).to eq user
      end

      it "必要な情報が入力されていない場合、保存に失敗し登録画面にリダイレクトされること" do
        invalid_params =
          { post: {
            title: "",
            content: "新規テスト内容",
            mood: "普通",
            user: user,
          } }
        #  レコードが増えないことを検証
        expect {
          post posts_path, params: invalid_params
        }.not_to change(Post, :count)
        expect(response).to have_http_status(:unprocessable_entity)
        expect(response.body).to include("タイトルを入力してください")
      end
    end

    describe "#edit" do
      context "ログインしている場合" do
        before { sign_in user }
  
        it "編集画面に遷移できること" do
          my_post = Post.create!(
            title: "編集テスト",
            content: "内容",
            mood: "普通",
            user: user
          )
          get edit_post_path(my_post)
          expect(response).to have_http_status(:success)
          expect(response.body).to include("日記を編集する")
        end
  
        it "他人の投稿の編集画面に遷移しようとすると、リダイレクトされること" do
          get edit_post_path(another_user_post)
          expect(response).to redirect_to(posts_path)
          expect(flash[:alert]).to include("権限がありません")
        end
      end
  
      context "ログインしていない場合" do
        it "ログイン画面に戻されること" do
          # 【ここが重要！】ログインしていないテスト用に、新しく日記を1つ用意する
          any_post = Post.create!(
            title: "テスト",
            content: "内容",
            mood: "普通",
            user: user
          )
          get edit_post_path(any_post)
          expect(response).to redirect_to(new_user_session_path)
          expect(flash[:alert]).to include("ログインしてください")
        end
      end
    end
    describe "#update" do
      let(:valid_params) { #更新用のデータを定義する
        { post: {
          title: "更新されたタイトル",
          content: "更新された内容",
          mood: "更新された気分",
          user: user,
        } }
      }
      before { sign_in user } #ログインする
      it "必要な情報が入力されている場合、保存に成功し一覧画面に遷移すること" do
        patch post_path first_post, params: valid_params
        expect(response).to redirect_to(post_path(first_post))
        expect(flash[:notice]).to include("更新しました")
        # MEMO 編集に成功した際に、SUCCESSのメッセージが表示されることを確認
        first_post.reload
        # MEMO 編集に成功したのち、一覧画面で更新後の内容に変更されていることを確認
        expect(first_post.title).to eq("更新されたタイトル")
      end
      it "必要な情報が入力されていない場合、保存に失敗し登録画面にリダイレクトされること" do
        patch post_path first_post, params: { post: { title: "" } }
        expect(response).to have_http_status(:unprocessable_content)
        # MEMO 編集画面でエラーメッセージが表示されていることを確認する
        expect(response.body).to include("タイトルを入力してください")
      end
    end
    describe "#destroy" do
      before { sign_in user }
      it "自分の投稿である場合、削除ができること" do
        first_post
        #レコードが１つ減ることを検証
        expect {
          delete post_path first_post
        }.to change(Post, :count).by(-1) #1件減ることを確認
        expect(response).to redirect_to(posts_path)
        # MEMO 削除した後、メッセージを確認
        expect(flash[:notice]).to include("削除しました")
      end
      it "他人の投稿については、削除できないこと" do
        delete post_path another_user_post # MEMOレコードが削除されていないことを確認
        expect(response).to redirect_to(posts_path)
        # MEMO アラートが出ることを確認
        expect(flash[:alert]).to include("権限がありません")
      end
    end
  end
end
