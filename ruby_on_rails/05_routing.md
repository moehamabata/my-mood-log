## Routingとは
- URLをどのコントローラーアクションに振り分けるかの仕組み全体
- URLと処理を結びつける仕組み
- URLとControllerのアクションを結びつけてくれる
- config/ routes.rbに記載すること
- URLパスに基づき、HTTPリクエストを受信
- Railsの特定コントローラーアクションに対応付けをしている
- URLのリクエストが飛んできた時に、どのコントローラーの、どのアクションにするかを決める場所になる

## Routeとはni
- 

**1. ルーティング確認**
```ruby
Rails.application.routes.draw do
  resources :books
  root 'home#index'
end
```

**2. resources :postsとは**
- postsに必要なCRUDのルーティングを全て自動で作ってくれること
- 本来であれば、１行ずつ書くべき内容をこの１行で全て生成してくれる

作ってくれるもの




学んだこと：
- RoutingとRoutesの

気づき・反省：
- RoutingとRoutesの意味が同じだと思っていた。