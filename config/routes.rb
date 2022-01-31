Rails.application.routes.draw do
  root to: "lists#index"
  resources :lists, only: [:index, :show,  :new, :create, :destroy] do
    resources :bookmarks, only: [:new, :create]
    resources :reviews, only: :create
    resources :movies, only: :create
  end
  resources :bookmarks, only: :destroy
  resources :reviews, only: :destroy
  resources :movies, only: :destroy

  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
