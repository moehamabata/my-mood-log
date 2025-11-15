class PostsController < ApplicationController
  # 一覧
  def index
    @posts=Post.all
  end

  # 詳細
  def show
    @post=Post.find(params[:id])
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
    @post=Post.find(params[:id])
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

  # ストロングパラメータ
  def post_params
    params.require(:post).permit(:title, :content)
  end
end

end