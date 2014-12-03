class WelcomeController < ApplicationController
  get '/' do
    @selected_lems = Lem.order(created_at: :desc).limit(10)
    erb :index
  end
end
