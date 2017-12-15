Rails.application.routes.draw do
  root "users#index" #renders the initial page to either login or register
  get 'songs' => 'users#show' #rendering the page to display a user's dashboard
  get 'songs/:id' => 'users#songs'
  get 'users/:id' => 'users#list'
  post 'users/create' => 'users#create' #action of registering a new user
  post '/sessions/create' => 'sessions#create' #completes action of logging user in
  post '/songs/create' => 'songs#create' #sends post request to create song
  post '/playlists/:id' => 'playlists#create'  
  patch 'users/:id' => 'users#update'
  delete 'sessions/:id' => 'sessions#destroy'
 
  
end
 