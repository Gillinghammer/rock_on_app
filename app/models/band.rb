class Band < ActiveRecord::Base
  attr_accessible :genre, :name
  has_many :albums
end
