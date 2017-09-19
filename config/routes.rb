Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  # adds a route
  root to: "users#index"

  # main page
  get '/users' => "users#index"
  # shows the new form
  get "/users/new" => "users#new", as:"new_user"
  # creates the user
  post "/users" => "users#create"
  # shows one user
  get "/users/:id" => "users#show", as: "user"

  # Logging in and logging out is controlled by the sessions controller and this to the log-in page
  get "/login" => "sessions#new"

  # actually set the session and log the user in => this is CREATING a new session (aka cookie)
  post "/sessions" => "sessions#create"
end


# Self-check for understanding: Which sessions controller action will we use to log out? => post '/logout', to: 'sessions#destroy'
