class PostsController < ApplicationController
before_action :set_post, only: [:show, :edit, :update]

  # 一覧
  def index
    @posts=Post.all
  end

  # 詳細
  def show
  end

  # 新規作成フォーム
  def new
    @post=Post.new
  end

  # 投稿保存
  def create
    @post=Post.new(post_params)
    if @post.save
      redirect_to @post
    else
      render :new
    end
  end

  # 編集フォーム
  def edit
  end

  # 投稿更新
  def update
    @post=Post.find(params[:id])
    if @post.update(post_params)
      redirect_to @post
    else
      render :edit
    end
  end

  # 重複していた処理をまとめる
  def set_post
    @post=Post.find(params[:id])

  # ストロングパラメータ
  def post_params
    params.require(:post).permit(:title, :content)
  end
end

end