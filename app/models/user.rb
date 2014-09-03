class User < ActiveRecord::Base
  has_secure_password
  attr_accessible :email, :hometown, :name, :role, :password, :password_confirmation, :avatar, :band

  has_many :playlists
  has_one :band

  validates :password, presence: true, on: :create
  validates :email, presence: true, uniqueness: true
  validates :name, presence: true

  mount_uploader :avatar, UserAvatarUploader
  
end
