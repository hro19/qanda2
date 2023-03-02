Rails.application.routes.draw do

  root to: 'questions#index'

  resources :questions do
    resources :answers, only: [:create, :edit, :update, :destroy]
  end

  # https://qiita.com/hapiblog2020/items/6c2cef49df5616da9ae3
  # qiita Rails 検索機能の実装
  get "search" => "searches#search"

end
