Rails.application.routes.draw do
  devise_for :users
  root to: 'pages#home'
  resourses :users, only: [:index, :show, :edit, :update] do
    resourses :matches, only: [:new, :create, :edit, :update]
  resourses :matches, only: :destroy
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
