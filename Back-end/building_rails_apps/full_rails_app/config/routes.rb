Rails.application.routes.draw do
  # miscellaneous
  get "/"                     => 'welcome#index', as: 'root'
  get "/about"                => 'welcome#about', as: 'about'

  # artists, songs
  resources :artists, :songs

  # playlists
  get  "playlists"                    => 'playlists#index', as: 'playlists'
  get  "playlists/new"                => 'playlists#new', as: 'new_playlist'
  post "playlists"                    => 'playlists#create'
  get  "playlists/:id"                => 'playlists#show', as: 'playlist'
  post "playlists/:id/add_song"       => 'playlists#add_song', as: 'add_song_to_playlist'
  post "playlists/:id/remove_song"    => 'playlists#remove_song', as: 'remove_song_from_playlist'
end
