class PostsController < ApplicationController
  before_action :authenticate_user!
  before_action :set_post, only: [:show, :edit, :update, :destroy]
  before_action :ensure_correct_user, only: [:show, :edit, :update, :destroy]

  rescue_from ActiveRecord::RecordNotFound, with: :redirect_not_found

  # 一覧
  def index
    @posts = current_user.posts.order(created_at: :desc)
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
    @post = current_user.posts.build(post_params)
    if @post.save
      redirect_to posts_path, notice: "日記を投稿しました！", status: :see_other
    else
      flash.now[:alert] = "投稿に失敗しました。内容を確認してください。"
      render :new, status: :unprocessable_content
    end
  end

  # 編集フォーム
  def edit
  end

  # 投稿更新
  def update
    if @post.update(post_params)
      redirect_to @post, notice: "更新しました", status: :see_other
    else
      flash.now[:alert] = "更新に失敗しました。内容を確認してください。"
      render :edit, status: :unprocessable_content
    end
  end

  # 削除
  def destroy
    @post.destroy
    redirect_to posts_path, notice: "削除しました", status: :see_other
  end

  private

  def set_post
    @post = Post.find(params[:id])
  end

  def redirect_not_found
    redirect_to posts_path, alert: "指定された投稿は見つかりませんでした"
  end

  def post_params
    params.require(:post).permit(:title, :content, :mood)
  end

  def ensure_correct_user
    if @post.nil? || @post.user_id != current_user.id
      redirect_to posts_path, alert: "権限がありません"
    end
  end
end
