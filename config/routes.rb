Rails.application.routes.draw do

  # Auth routes
  devise_for :users,
    path: 'auth', 
    path_names: { 
      sign_in: 'login', 
      sign_out: 'logout',
      registration: 'register', 
      sign_up: 'signup' 
    },
    controllers: { 
      sessions: 'users/sessions',
      registrations: 'users/registrations',
      omniauth_callbacks: 'users/omniauth_callbacks'
    }

  # Get all users route
  match '/users', to: 'users#index', via: 'get'

  # Get user by id route
  match '/users/:id', to: 'users#show', via: 'get'

  # Route to logged_in
  get :logged_in, to: "sessions#logged_in"

  # Homepage
  root to: "static#home"

end
