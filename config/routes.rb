Rails.application.routes.draw do
  resources :users
  resources :auths
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  # OAuth
  namespace :api do
    namespace :v1 do
      get '/login', to: 'auth#spotify_request'
      get '/auth', to: 'auth#show'
      get '/user', to: 'users#create'
    end
  end
end
