class Ability
  include CanCan::Ability

  def initialize(user)
    user ||= User.new

    alias_action :edit, :update, :to => :edit_and_update

    if user.role? :admin
      can :manage, :all
    elsif user.role? :fan
      can :read, [User, Song, Album, Band, Playlist]
      cannot :create, User
      can :edit_and_update, User do |person|
        person.try  :user == user
      end
      can :edit_and_update, Song do |song|
        song.album.band.user == user
      end
      can :edit_and_update, Album do |album|
        album.band.user == user
      end
      can :edit_and_update, Band do |band|
        band.user == user
      end
      can :edit_and_update, Playlist do |playlist|
        playlist.user == user
      end
    else
        can :create, User
        can :read, [User, Song, Album, Band, Playlist]
    end
  end

end
