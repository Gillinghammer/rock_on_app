class Song < ActiveRecord::Base
  attr_accessible :album_id, :name, :track
  belongs_to :album

  acts_as_commentable
  
  #todo add recent tracks scope
  #todo add most commented tracks scope

  mount_uploader :track, SongTrackUploader
  
end
