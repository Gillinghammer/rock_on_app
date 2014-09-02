class Song < ActiveRecord::Base
  attr_accessible :album_id, :name, :track
  belongs_to :album
  mount_uploader :track, SongTrackUploader
end
