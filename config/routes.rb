Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  namespace :api do 
    namespace :v1 do
      resources :users, only: [:create]
      post '/login', to: 'auth#create'
      get '/profile', to: 'users#profile' 
    end
  end

  # GAME ROUTES
  get '/game/:id', to: 'game#show'
  get '/game_screenshots/:id', to: 'game#gameScreenshots'
  get '/released', to: 'game#justReleased'
  get '/game/like/:id', to: 'game#liked'
  get '/game/search/:name', to: 'game#search'
  get '/top_games/:year', to: 'game#topGames'
  get '/games_by_genre/:genre', to: 'game#gamesByGenre'

  #USER ROUTES
  get '/user/all_info', to: "user#allInfo"
  get '/user/:id/info', to: "user#info"
  get '/user/recommendations', to: "user#recommendations"

  #POST ROUTES
  post '/posts', to: "post#create"
  get '/posts', to: "post#all"

  #CREATE FRIEND
  post '/friend/:id', to: "user#createFollow"
end
