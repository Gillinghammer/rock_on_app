RockOnApp::Application.routes.draw do 
  root to: 'home#home'

  resources :users
  resources :sessions
  resources :playlists
  resources :reports
  
  resources :bands do
    resources :albums do
      resources :songs do
        resources :comments
      end
    end
  end

  get 'login', to: 'sessions#new', as: 'login'
  get 'logout', to: 'sessions#destroy', as: 'logout'
end
