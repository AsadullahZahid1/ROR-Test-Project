Rails.application.routes.draw do

  devise_for :admin_users, ActiveAdmin::Devise.config
  ActiveAdmin.routes(self)



  devise_for :User





  resources :posts do
    resources :comments, only: [:create, :destroy]
    collection do
      get 'search'

    end
  end


  resources :contacts, only: [:new, :create]
  resources :ratings, only: [:new, :create]
  resources :users  do
    collection do
      get 'live_search'
      get 'search', to: 'users#search'
    end
  end

  root 'posts#index'
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"

end
