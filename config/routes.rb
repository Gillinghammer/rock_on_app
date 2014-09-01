RockOnApp::Application.routes.draw do
  root to: 'users#index'
  resources :users
  resources :sessions

  get 'login', to: 'sessions#new', as: 'login'
  get 'logout', to: 'sessions#destroy', as: 'logout'
end
