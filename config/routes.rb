Rails.application.routes.draw do
  devise_for :users
  root to: 'pages#home'
  resources :users, only: [:index, :show, :edit, :update] do
    resources :matches, only: [:index, :create, :edit, :update]
  end
  resources :matches, only: [:index, :new, :destroy]
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
