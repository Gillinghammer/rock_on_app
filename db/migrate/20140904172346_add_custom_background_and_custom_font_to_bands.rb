class AddCustomBackgroundAndCustomFontToBands < ActiveRecord::Migration
  def change
    add_column :bands, :custom_background, :string
    add_column :bands, :custom_font, :string
  end
end
