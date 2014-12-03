class CreateArtists < ActiveRecord::Migration
  def change
    create_table(:artists) do |artists_table|
      artists_table.string(:name)
      artists_table.string(:nationality)
      artists_table.text(:photo_url)
    end
  end
end
