class AddJukeboxToSongs < ActiveRecord::Migration
  def change
    add_column :songs, :jukebox, :string
  end
end
