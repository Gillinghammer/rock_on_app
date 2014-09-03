class AddBandArtToBand < ActiveRecord::Migration
  def change
    add_column :bands, :band_art, :string
  end
end
