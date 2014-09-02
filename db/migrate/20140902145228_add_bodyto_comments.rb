class AddBodytoComments < ActiveRecord::Migration
  def up
    add_column :comments, :body, :text
  end

  def down
    remove_column :comments, :body, :text
  end
end
