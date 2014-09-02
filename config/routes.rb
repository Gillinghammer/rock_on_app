RockOnApp::Application.routes.draw do 
  root to: 'home#home'

  resources :users
  resources :sessions
  resources :albums
  resources :songs
  resources :bands
  resources :playlists

resources :songs do
  resources :comments
end


  get 'login', to: 'sessions#new', as: 'login'
  get 'logout', to: 'sessions#destroy', as: 'logout'
end
