class MoodsControllerLile
  def create(params)
    moood = Mood.new(
      feeling: params[:feeling],
      note: params[:note]
    )

    if mood.valid?
      puts "保存成功！: #{mood.inspect}"
    else
      puts "バリデーションエラー"
    end
  end
end

controller = MoodsControllerLike.new
controller.create(feeling: "happy", note: "仕事が楽しかった！")