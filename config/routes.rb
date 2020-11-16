Rails.application.routes.draw do
  devise_for :users
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  root to: 'boards#index'

  resources :boards, only: [:create, :show, :new, :edit, :update, :destroy]

  resources :tasks, only: [:create, :new, :show, :edit, :update, :destroy]
end
