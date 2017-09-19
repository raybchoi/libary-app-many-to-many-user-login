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

  # Logging in and logging out is controlled by the sessions controller.
  get "/login" => "sessions#new"

end
# Self-check for understanding: Justify the choice to use sessions#new for the log in form. => you have a new user so you want them to create a new session form

# Self-check for understanding: Which sessions controller action will we use to actually set the session and log the user in? => post '/login', to: 'sessions#create'

# Self-check for understanding: Which sessions controller action will we use to log out? => post '/logout', to: 'sessions#destroy'
