class Song < ActiveRecord::Base
  attr_accessible :album_id, :name

  belongs_to :album

end
