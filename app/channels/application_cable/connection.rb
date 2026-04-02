module ApplicationCable
<<<<<<< HEAD
# ApplicationCableという名前のモジュールを定義する
  class Connection < ActionCable::Connection::Base
# Connectionクラスにチャネルの親クラスを継承する
  end
end
=======
# ActionCableをモジュールに分け、Ruby on Railsに含まれているリアルタイム通信を可能にする
  class Connection < ActionCable::Connection::Base
# ActionCable::Connection::BaseのRailsの基礎をClass Connectionが継承する 
  end
end
>>>>>>> 15e83568e23540d107d48e9b5f9898576315dcad
