class RemovePlaylistIdFromSongs < ActiveRecord::Migration
  def up
    remove_column :songs, :playlist_id
  end

  def down
    add_column :songs, :playlist_id, :string
  end
end
