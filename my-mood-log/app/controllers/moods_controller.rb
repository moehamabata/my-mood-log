class MoodsController < ApplicationController
  def mood_params
    # ストロングパラメータの設定（タイトル、内容）以外の不正なパラメータがmoodモデルに送られた場合は拒否
    params.require(:mood).permit(:title, :content)
  end

  # 記事の作成画面は？？？
  def new
    @mood = Mood.new
  end
  
  # 保存処理はどこで行なってるの？
  def create
    @mood = Mood.new(mood_params)

    if @mood.save
      # 保存処理 → 詳細画面へ
      # moodの詳細画面に遷移して、投稿しましたという文字をユーザーに向けて表示する。
      redirect_to @mood, notice: "投稿しました！"
    else
      # 保存処理に失敗した場合はどうするの？？？
      # 保存失敗　→ 新規作成画面を再表示
      flash.now[:alert] = "投稿に失敗しました"
      render :new
    end
  end

  def index
  end
end