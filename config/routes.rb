Rails.application.routes.draw do
  get 'games/new'
  get 'games/create'
  get 'games/index'
  get 'games/show'
  get 'games/edit'
  get 'games/update'
  get 'games/delete'
  devise_for :users
  root to: 'pages#home'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  resources :games
  resources :reservations, only: [:index, :new, :create, :update, :edit] do
    resources :reviews, only: [:index, :new, :create]
  end
  resources :users, only: :show do
    resources  :reviews, only: :index
  end
end
