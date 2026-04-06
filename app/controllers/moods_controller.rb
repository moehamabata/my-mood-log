class MoodsController < ApplicationController
  # ログインしていないユーザーをログイン画面に飛ばす
  before_action :authenticate_user!

  def index
    # 一覧を表示するためのデータを準備
    @moods = current_user.moods.order(created_at: :desc)
  end

  def new
    @mood = current_user.moods.build
  end

  def create
    # 現在のユーザーに紐付いた新しい日記を作成
    @mood = current_user.moods.build(mood_params)

    if @mood.save
      # 保存できたら一覧画面（index）に戻る
      redirect_to moods_path, notice: "日記を投稿しました！"
    else
      flash.now[:alert] = "投稿に失敗しました。内容を確認してください。"
      render :new, status: :unprocessable_entity
    end
  end

  # ↓ もし「詳細を見る」をクリックしてエラーが出るなら、この show が必要です
  def show
    @mood = current_user.moods.find(params[:id])
  end

  private

  def mood_params
    # あなたのDBの項目名に合わせて設定してください
    # もしDBが「title」と「content」なら、ここもそれに合わせる必要があります
    params.require(:mood).permit(:feeling, :note)
  end
end
