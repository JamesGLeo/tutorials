Rails.application.routes.draw do
  get 'todos/index'

  get 'todos/show'

  get 'todos/new'

  get 'todos/edit'

  get 'todos/create'

  get 'todos/destroy'

  get 'todos/update'

  resources :users, only: [ :index, :show, :new, :create ]
  resources :todos
  get "/login" => "users#login", as: "login"
  post "/sessions" => "sessions#login"
  delete "/sessions" => "sessions#logout", as: "logout" # logout_path is now defined
  root "users#new"
end

# post "/login" => "sessions#login"
# delete "/logout" => "sessions#logout", as: "logout"