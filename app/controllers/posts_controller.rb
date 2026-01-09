class PostsController < ApplicationController
# PostsControllerクラスにApplicationControllerを継承させる
before_action :set_post, only: [:show, :edit, :update]
# 共通の準備作業を自動化させておく
# アクション（各メソッド）が実行される前に、show, edit, updateの3つのことを実行してほしい

  # 一覧
  def index
  # indexを定義する
    @posts=Post.all
  end

  # 詳細
  def show
  # showを定義する
  end

  # 新規作成フォーム
  def new
  # newを定義する
    @post=Post.new
  end

  # 投稿保存
  def create
  # createを定義する
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