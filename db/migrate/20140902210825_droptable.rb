class Droptable < ActiveRecord::Migration
  def change
    drop_table :songs_playlists
  end
end
