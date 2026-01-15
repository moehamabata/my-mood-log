class PostsController < ApplicationController
# PostsControllerクラスにApplicationControllerを継承させる
before_action :set_post, only: [:show, :edit, :update]
# 共通の準備作業を自動化させておく
# アクション（各メソッド）が実行される前に、show, edit, updateの3つのことを実行してほしい

  # 一覧
  def index
  # indexを定義する
    @posts=Post.all
   # データベースに保存されている全ての保存データを丸ごと持っていく
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
    # 投稿を保存した際は
      redirect_to @post
      # 投稿を表示させる
    else
      render :new
    　# 投稿を保存しない際は新規投稿画面に戻る
    end
  end

  # 編集フォーム
  def edit
  # editを定義する
  end

  # 投稿更新
  def update
  # 更新を定義する
    @post=Post.find(params[:id])
    # idから該当するデータを1件取り出す
    if @post.update(post_params)
      redirect_to @post
    # 投稿に成功したら該当ポストを反映させる
    else
      render :edit
    # 投稿に失敗したら編集画面に戻る
    end
  end

  # 重複していた処理をまとめる
  def set_post
  # set_postを定義する
    @post=Post.find(params[:id])
    # idから該当するデータを1件取り出す
  # ストロングパラメータ
  def post_params
    # post_
    params.require(:post).permit(:title, :content)
  end
end

end