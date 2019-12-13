Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  namespace :api do 
    namespace :v1 do
      resources :users, only: [:create]
      post '/login', to: 'auth#create'
      get '/profile', to: 'users#profile' 
    end
  end

  get '/game/:id', to: 'game#show'
  get '/game_screenshots/:id', to: 'game#gameScreenshots'
  get '/released', to: 'game#justReleased'
  
end
