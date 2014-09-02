class RemoveBandFromUsers < ActiveRecord::Migration
  def up
    remove_column :users, :band
  end

  def down
    add_column :users, :band, :string
  end
end
