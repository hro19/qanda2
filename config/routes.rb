Rails.application.routes.draw do

  root to: 'questions#index'

  resources :questions do
    resources :answers, only: [:create, :edit, :update, :destroy]
  end

end
