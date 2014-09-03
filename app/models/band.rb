class Band < ActiveRecord::Base
  attr_accessible :genre, :name, :band_art
  has_many :albums
  belongs_to :user

  mount_uploader :band_art, BandArtUploader

  scope :recent, order(created_at: :desc).limit(3)

end
