class User < ActiveRecord::Base
  has_secure_password
  attr_accessible :email, :hometown, :name, :role, :password, :password_confirmation, :avatar, :band

  has_many :playlists, dependent: :destroy
  has_one :band, dependent: :destroy

  validates :password, presence: true, on: :create
  validates :email, presence: true, uniqueness: true
  validates :name, presence: true

  mount_uploader :avatar, UserAvatarUploader

  def role?(role_to_compare)
    self.role.to_s == role_to_compare.to_s
  end
  
end
