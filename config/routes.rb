Rails.application.routes.draw do
  devise_for :users
  root 'posts#index'
  resources :posts
  resources :tags, only: [:show]
  resources :categories, only: [:show]

  namespace :admin do
    resources :categories, except: [:show]
    resources :posts, except: [:show, :index]
    resources :pictures, only: [:create, :destroy]
  end
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
