class ApplicationController < Sinatra::Base

  helpers Sinatra::AuthenticationHelper

  enable :sessions
  enable :method_override

  require File.expand_path(File.dirname(__FILE__) + '/../connection')

  set :public_folder, File.expand_path(File.dirname(__FILE__) + '/../public')
  set :views, File.expand_path(File.dirname(__FILE__) + '/../views')


  # not_found do
  #   status 404
  #   "LemLemBot says ':('"
  # end
end
