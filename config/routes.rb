Rails.application.routes.draw do
  devise_for :users
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html
  resources :categories do
    resources :deals
  end
  # Defines the root path route ("/")
  # root "articles#index"
  root "welcome#index"
end
