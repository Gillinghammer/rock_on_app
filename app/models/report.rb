class Report < ActiveRecord::Base
  attr_accessible :comment_id
  has_many :comments
end
