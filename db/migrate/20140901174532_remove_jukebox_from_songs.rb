class RemoveJukeboxFromSongs < ActiveRecord::Migration
  def up
    remove_column :songs, :jukebox
  end

  def down
    add_column :songs, :jukebox, :string
  end
end
