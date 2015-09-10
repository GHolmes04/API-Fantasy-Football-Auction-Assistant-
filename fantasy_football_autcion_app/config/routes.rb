Rails.application.routes.draw do
  # The priority is based upon order of creation: first created -> highest priority.
  # See how all your routes lay out with "rake routes".

  resources :users, except: [:new, :edit]
  resources :franchises, except: [:destroy]
  resources :rosters, except: [:destroy]
  resources :leagues
  resources :players
  post '/login', to: 'users#login'
end
