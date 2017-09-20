Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  # adds a route
  root to: "users#index"

  # main page
  get '/users' => "users#index"
  # shows the new form
  get "/users/new" => "users#new", as: "new_user"
  # creates the user
  post "/users" => "users#create"
  # shows one user
  get "/users/:id" => "users#show", as: "user"

  # Logging in and logging out is controlled by the sessions controller and this to the log-in page
  get "/login" => "sessions#new"

  # actually set the session and log the user in => this is CREATING a new session (aka cookie)
  post "/sessions" => "sessions#create"

  # We use sessions#destroy because all of the information that's keeping a user logged in is in the user's session. This will allow us to delete the user sessions
  get "/logout" => "sessions#destroy"

  # route to be able to view all the libraries
  get "/libraries" => "libraries#index"

  #route to display the new form
  get "/libraries/new" => "libraries#new", as: "new_library"

  # route for when the form is submited to create a new record
  post "/libraries" => "libraries#create"

  # route to see one library
  get "/libraries/:id" => "libraries#show", as: "library"

  # We want to be able to view all user memberships to a library. We need to decide on a route for this. Based on RESTful routing, we could choose /users/:user_id/libraries or /libraries/:library_id/users. Either one would be okay, but an application should not have both. We'll choose the first since this app is more centered on users than libraries.
  get "/users/:id/libraries" => "library_users#index", as: "user_libaries"

  # route for when the user hits the button to join a library it allows for that user to join it
  post "/libraries/:id/users" => "library_users#create", as: "library_users"

end


# Self-check for understanding: Which sessions controller action will we use to log out? => post '/logout', to: 'sessions#destroy'
