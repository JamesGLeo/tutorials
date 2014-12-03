class CreatePlaylistsSongs < ActiveRecord::Migration
  def change
    create_table :playlists_songs, id: false do |t|
        t.references(:song)
        t.references(:playlist)
    end
  end
end
