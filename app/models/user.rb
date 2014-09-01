class User < ActiveRecord::Base
  has_secure_password
  has_many :albums
  has_many :songs, through: :albums
  attr_accessible :band, :email, :hometown, :name, :password_digest, :role, :password, :password_confirmation
  validates :password, presence: true, on: :create
  validates :email, presence: true, uniqueness: true
  validates :role, presence: true
  validates :name, presence: true

  scope :fans, where(role: 'Fan')
  scope :bands, where(role: 'Band')
  
end
