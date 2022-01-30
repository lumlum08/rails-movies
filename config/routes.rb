Rails.application.routes.draw do
  root to: "lists#index"
  resources :lists, only: [:index, :show,  :new, :create] do
    resources :bookmarks, only: [:new, :create]
    resources :reviews, only: :create
  end
  resources :bookmarks, only: :destroy
  resources :reviews, only: :destroy
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
