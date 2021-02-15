Rails.application.routes.draw do
  get 'splash_screen/home'
  get '/signup', to: 'users#new'
  get '/login', to: 'sessions#new'
  get '/external', to: 'exercises#ungrouped_exercises'
  delete 'logout', to: 'sessions#destroy'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  root 'splash_screen#home'
  resources :users
  resources :groups, only: %i[new create index]
  resources :sessions, only: %i[new create destroy]
  resources :exercises, only: %i[new create index]
end
