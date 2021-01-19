Rails.application.routes.draw do
  get 'sessions/new'
  get 'splash_screen/home'
  get '/signup', to: 'users#new'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  root 'splash_screen#home'
  resources :users
end
