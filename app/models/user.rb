class User < ActiveRecord::Base
  has_secure_password
  attr_accessible :band, :email, :hometown, :name, :role, :password, :password_confirmation, :avatar

  has_many :playlists

  validates :password, presence: true, on: :create
  validates :email, presence: true, uniqueness: true
  validates :name, presence: true

  mount_uploader :avatar, UserAvatarUploader
  
end
