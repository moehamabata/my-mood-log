module ApplicationCable
<<<<<<< HEAD
# ApplicationCableという名前のモジュールを定義する
  class Channel < ActionCable::Channel::Base
# 親分となる各クラス（ActionCable::Channel）を定義し、その親分がRails本体が用意しているActionCable::Baseを継承する
  end
end

# moduleが使われる理由としては、Action Cable関連のクラスをひとまとめしたり、共通のメソッドを定義して他のクラスで再利用できるようにするため
# ActionCable::Channel::Base → Railsのリアル通信機能であるAction Cableにおけるチャネルの親クラスのこと
# チャネルとは、情報やデータ、信号といった固定的な伝達・流通経路のことを指す

=======
# ApplicationCableをモジュールに分ける
  class Channel < ActionCable::Channel::Base
# ActionCable::Channel::BaseのRuby on Railsの基礎をclass Channelに継承させる
  end
end
>>>>>>> 15e83568e23540d107d48e9b5f9898576315dcad
