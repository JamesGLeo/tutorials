require 'sinatra'
require 'sinatra/reloader'
require 'active_record'

# Load specific routes
require_relative 'controllers/artists'
require_relative 'controllers/songs'
require_relative 'controllers/playlists'

# Load models
require_relative 'models/artist'
require_relative 'models/song'
require_relative 'models/playlist'

# Load Active Record and connect to the DB
ActiveRecord::Base.establish_connection({
  database: 'tunr_db',
  adapter: 'postgresql'
})

# Fix an issue with sinatra and Active Record where connections are left open
after do
  ActiveRecord::Base.connection.close
end


####################
#  General routes  #
####################

get '/' do
  erb(:home)
end

get '/about' do
  erb(:about)
end
