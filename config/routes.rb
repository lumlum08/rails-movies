Rails.application.routes.draw do
  resources :lists, only: [:index, :show,  :new, :create] do
    resources :bookmarks, only: [:new, :create, :destroy]
  end
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
