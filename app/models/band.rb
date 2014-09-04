class Band < ActiveRecord::Base
  attr_accessible :genre, :name, :band_art
  has_many :albums, dependent: :destroy
  belongs_to :user

  mount_uploader :band_art, BandArtUploader

  scope :newest, order('created_at desc').limit(1)

end
