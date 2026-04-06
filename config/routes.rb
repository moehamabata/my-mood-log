Rails.application.routes.draw do
  # ログイン機能（Devise）の設定
  devise_for :users

  # トップページの設定（moodsの一覧を表示）
  root "moods#index"

  # 各機能のルート設定
  resources :moods
  resources :users, only: [:show]
  resources :posts
end