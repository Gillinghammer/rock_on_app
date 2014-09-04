class Song < ActiveRecord::Base
  attr_accessible :album_id, :name, :track, :playlist_id
  belongs_to :album
  has_and_belongs_to_many :playlist

  acts_as_commentable
  
  #todo add most commented tracks scope
  scope :popular, joins(:comments).group('songs.id').order('count(comments.id) desc').limit(4)

  #todo allow bands to see recent comments on songs they 'own'

  mount_uploader :track, SongTrackUploader
  
end