require 'bundler'
Bundler.require

require './models/user'
require './models/lem'

require './helpers/authentication_helper'

require './controllers/application_controller'
require './controllers/welcome_controller'
require './controllers/users_controller'
require './controllers/sessions_controller'
require './controllers/lems_controller'


map('/users'){ run UsersController }
map('/sessions'){ run SessionsController }
map('/lems'){ run LemsController }
map('/'){ run WelcomeController }
