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
  post '/game/like/:id', to: 'game#liked'
  get '/game/search/:name', to: 'game#search'
  get '/top_games/:year', to: 'game#topGames'
  get '/games_by_genre/:genre', to: 'game#gamesByGenre'

  #USER ROUTES
  get '/user/all_info', to: "user#allInfo"
  get '/user/:id/info', to: "user#info"
  get '/user/recommendations', to: "user#recommendations"
  get '/user/search/:name', to: "user#search"
  patch '/user/edit', to: "user#edit"

  #POST ROUTES
  post '/posts', to: "post#create"
  get '/posts', to: "post#all"
  get '/mainuser_posts', to: "post#mainuserPosts"
  delete '/posts/:id', to: "post#destroy"

  #CREATE FRIEND
  post '/friend/:id', to: "user#createFollow"
  delete '/friend/:id', to: "user#destroyFollow"

  #GAME REVIEW ROUTES
  get '/reviews/:id', to: "review#all" #gets all the reviews relating to the specific game
  post '/reviews', to: "review#create"
  delete '/review/:id', to: "review#destroy" #destroy the review using the review ID
end
