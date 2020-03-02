Rails.application.routes.draw do
  get 'matches/new'
  get 'matches/create'
  get 'matches/edit'
  get 'matches/update'
  get 'matches/destroy'
  devise_for :users
  root to: 'pages#home'
  resources :users, only: [:index, :show, :edit, :update] do
    resources :matches, only: [:new, :create, :edit, :update]
  end
  resources :matches, only: :destroy
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
