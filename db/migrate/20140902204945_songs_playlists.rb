class SongsPlaylists < ActiveRecord::Migration
  def change
    create_table :songs_playlists, :id => false do |t|
      t.integer :song_id
      t.integer :playlist_id
    end
  end
end
