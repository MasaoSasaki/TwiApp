Rails.application.routes.draw do
  root 'posts#index'
  devise_for :users
  resources :posts, except: %i[show edit update]
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
end
