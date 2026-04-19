Rails.application.routes.draw do
  # ログイン機能（Devise）の設定
  devise_for :users

  # トップページの設定（postsの一覧を表示）
  root "posts#index"

  # 各機能のルート設定
  resources :users, only: [:show]
  resources :posts
end