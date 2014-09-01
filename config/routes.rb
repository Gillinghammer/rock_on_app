RockOnApp::Application.routes.draw do
  root to: 'sessions#home'
  resources :users
  resources :sessions
  resources :albums

  get 'login', to: 'sessions#new', as: 'login'
  get 'logout', to: 'sessions#destroy', as: 'logout'
end
