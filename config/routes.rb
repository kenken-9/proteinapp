Rails.application.routes.draw do
  get 'users/show'
  devise_for :users

  root "items#index"

  resources :items, shallow: true do
    resources :comments, only: [:create]
    resource :bookmarks, only: [:create, :destroy]
  end
end
