Rails.application.routes.draw do
  get "users/show"
  devise_for  :users

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

  devise_scope :user do
    post "users/guest_sign_in" , to: "users/sessions#guest_sign_in"
  end

end

