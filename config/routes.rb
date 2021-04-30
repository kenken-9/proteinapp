Rails.application.routes.draw do
  devise_for :users

  root "items#index"

  resources :items, shallow: true do
    resources :comments, only: [:create]
  end
end
