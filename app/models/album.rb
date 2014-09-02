class Album < ActiveRecord::Base
  attr_accessible :name, :band_id
  has_many :songs
  belongs_to :band

  acts_as_commentable

  scope :recent, last(3)

  #todo Mount Uploader for album artwork
end
