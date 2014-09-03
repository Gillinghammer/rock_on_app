class Album < ActiveRecord::Base
  attr_accessible :name, :band_id, :album_art

  has_many :songs, dependent: :destroy
  belongs_to :band

  acts_as_commentable

  scope :recent, order('created_at desc').limit(6)

  mount_uploader :album_art, AlbumArtUploader
end
