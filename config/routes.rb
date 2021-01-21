Rails.application.routes.draw do
  get 'splash_screen/home'
  get '/signup', to: 'users#new'
  get '/login', to: 'sessions#new'
  delete 'logout', to: 'sessions#destroy'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  root 'splash_screen#home'
  resources :users
  resources :groups
  resources :sessions, only: %i[new create destroy]
end
