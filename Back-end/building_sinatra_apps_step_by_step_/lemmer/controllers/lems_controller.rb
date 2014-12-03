class LemsController < ApplicationController
  post '/' do
    authenticate!
    current_user.lems << Lem.create(params[:lem])
    redirect '/users/profile'
  end
  delete '/:id' do
    Lem.delete(params[:id])
    redirect '/users/profile'
  end
end
