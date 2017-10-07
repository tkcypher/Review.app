Rails.application.routes.draw do
  get "/top" => "items#top"

  get "/about" => "items#about"

  get 'favorites/create'

  get 'favorites/destroy'

  get 'takes/create'

  get 'takes/destroy'

  get 'users/index'

  get 'users/show'


  devise_for :users, :controllers => {
   :registrations => 'users/registrations' 
  }

  resources :users do
  	get :takes, on: :member
    resource :relationships, only: [:create, :destroy]
    get :follows, on: :member
    get :followers, on: :member
    get :favorites, on: :member
  end
  resources :lessons do
  	resource :takes, only: [:create, :destroy]
    get :takers, on: :member
    resource :reviews, only: [:create, :destroy] do
      resource :favorites, only: [:create, :destroy]
    end
  end
  root 'lessons#index'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
