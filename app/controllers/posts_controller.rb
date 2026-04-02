class PostsController < ApplicationController
  # PostsControllerクラスにApplicationControllerを継承させる

  before_action :authenticate_user!
  before_action :set_post, only: [:show, :edit, :update, :destroy]
  before_action :ensure_correct_user, only: [:show, :edit, :update, :destroy]

  # ActiveRecord::RecordNotFound が起きたら、redirect_not_found メソッドを
  rescue_from ActiveRecord::RecordNotFound, with: :redirect_not_found

  # 一覧
  def index
    # 「今ログインしている人（current_user）」に
    # 紐づいている（外部キー user_id が一致する）日記だけを持ってこれる
    @moods=current_user.posts
  end

  # 詳細
  def show
  end

  # 新規作成フォーム
  def new
    @post = Post.new
  end

  # 投稿保存
  def create
    # ログイン中のユーザー（current_user）の投稿（posts）とする
    # これで「誰が書いたか(user_id)」が自動的にセットされる！
    # ログインユーザーに紐付けてデータを作成する
    # 今ログインしている本人のユーザー情報であるIDが自動的にセットされる
    @post = current_user.posts.build(post_params)
    # 保存を試みる
    if @post.save
      # 投稿を保存したら詳細画面へ（Rails 7対応のstatusを追加）
      redirect_to posts_path, notice: "投稿できました！", status: :see_other
    else
      # 保存に失敗したら今のフォーム画面を再表示する
      puts @post.errors.full_messages
      # メッセージのエラーを読み込み、反映させる
      render :new, status: :unprocessable_entity
      # 新規投稿画面をもう1回表示
    end
  end

  # 編集フォーム
  def edit
  end

  # 投稿更新
  def update
    if @post.update(post_params)
      redirect_to @post, notice: "更新しました" # 投稿に成功したら該当ポストを反映させる
    else
      render :edit, status: :unprocessable_content
    end
  end

  # 削除フォーム
  def destroy
    @post = current_user.posts.find_by(id: params[:id])

    if @post
      @post.destroy
      redirect_to posts_path, notice: "削除しました", status: :see_other
    else
      # 削除後は投稿一覧画面に戻る
      redirect_to posts_path, alert: "権限がありません", status: :see_other
    end
  end

  private

  def set_post
    # idから該当するデータを1件取り出す
    @post = Post.find(params[:id])
  end

  def redirect_not_found
    redirect_to posts_path, alert: "指定された投稿は見つかりませんでした"
  end

  # ストロングパラメータ
  def post_params
    params.require(:post).permit(:title, :content, :mood)
  end

  def ensure_correct_user
    if @post.nil? || @post.user_id != current_user.id
      redirect_to posts_path, alert: "権限がありません"
    end
  end
end
