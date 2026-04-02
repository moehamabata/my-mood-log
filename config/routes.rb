# config/routes.rb
Rails.application.routes.draw do
  devise_for :users
  root "posts#index"

  resources :posts
  resources :users, only: [:show] # ←これを追記（プロフィール表示用）
Rails.application.routes.draw do
  root "moods#index" #ここでトップページを moods#index に設定
  resources :moods
end