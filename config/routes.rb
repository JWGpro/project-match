Rails.application.routes.draw do
  devise_for :users
  root to: 'pages#home'
  resources :users, only: [:index, :show, :edit, :update] do
    resources :matches, only: [:index, :show, :create, :edit, :update] do
      resources :messages, only: :create
    end
  end
  resources :matches, only: [:index, :destroy]
  resources :messages, only: :destroy
  resources :searches, only: [:new]
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
