Rails.application.routes.draw do
  get "users/show"
  devise_for :users

  root "items#index"

  resources :items, shallow: true do
    resources :comments, only: [:create]
    resource :bookmarks, only: [:create, :destroy]
    collection do
      get "search"
    end
  end

  resources :users, only: [:show] do
    get :bookmarks, on: :collection
  end
end
