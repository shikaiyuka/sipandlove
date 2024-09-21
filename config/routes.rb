Rails.application.routes.draw do
  devise_for :users
  resources :users, only: [:show]
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html

  resources :tweets  do
    resources :likes, only: [:create, :destroy]
  end
  root 'tweets#top'
  get 'tweets/new' => 'tweets#new'
  get 'tweets/show' => 'tweets#show'
end

