Rails.application.routes.draw do
  # The priority is based upon order of creation: first created -> highest priority.
  # See how all your routes lay out with "rake routes".

  resources :users, except: [:new, :edit]
  resources :franchises, except: [:destroy, :index]
  resources :rosters, except: [:destroy]
  resources :leagues do
    resources :franchises, except: [:new, :edit, :destroy]
  end
  resources :players
  post '/login', to: 'users#login'
  get '/leagues/:id/franchises', to: 'franchises#index'
end
