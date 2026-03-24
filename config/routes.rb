Rails.application.routes.draw do
  root "moods#index" #ここでトップページを moods#index に設定
  resources :moods
end