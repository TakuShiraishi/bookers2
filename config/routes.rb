Rails.application.routes.draw do
  root to: 'homes#top'
  devise_for :users
  get "home/about" => "homes#about", as: "about"
  # resources :post_images, only: [:new, :create, :index, :show, :destroy] do
  # resources :post_comments, only: [:create, :destroy]
  # resource :favorites, only: [:create, :destroy]
  # end
  resources :books
  resources :users
   # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
