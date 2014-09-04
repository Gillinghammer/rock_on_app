class Band < ActiveRecord::Base
  attr_accessible :genre, :name, :band_art, :custom_background, :custom_font
  has_many :albums, dependent: :destroy
  belongs_to :user

  mount_uploader :band_art, BandArtUploader
  mount_uploader :custom_background, BandArtUploader

  scope :newest, order('created_at desc').limit(1)

end
