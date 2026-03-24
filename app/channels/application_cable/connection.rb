module ApplicationCable
# ActionCableをモジュールに分け、Ruby on Railsに含まれているリアルタイム通信を可能にする
  class Connection < ActionCable::Connection::Base
# ActionCable::Connection::BaseのRailsの基礎をClass Connectionが継承する 
  end
end