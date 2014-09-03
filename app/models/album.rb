class Album < ActiveRecord::Base
  attr_accessible :name, :band_id, :album_art
  has_many :songs
  belongs_to :band

  acts_as_commentable

  scope :recent, last(3)

  mount_uploader :album_art, AlbumArtUploader
end
