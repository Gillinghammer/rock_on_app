class Album < ActiveRecord::Base
  attr_accessible :name, :user_id
  has_many :songs
  belongs_to :user

end
