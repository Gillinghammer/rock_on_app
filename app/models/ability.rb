class Ability
  include CanCan::Ability

  def initialize(user)
    user ||= User.new

    # alias_action :create, :read, :edit, :update, :destroy, :to => :crud

    if user.role? :admin
      can :manage, :all
    elsif user.persisted?

      can :read, :all

      can :create, Playlist
      can :create, Album if user.band 
      can :create, Band
      can :create, Song

      can :manage, Playlist do |playlist|
        playlist && playlist.user == user
      end

      can :manage, Band do |band|
        band && band.user == user
      end

      can :manage, Album do |album|
        album && album.band && album.band.user == user
      end

      can :manage, Song do |song|
        song && song.album && song.album.band && song.album.band.user == user
      end

      can :manage, Comment do |comment|
        comment.user_id  == user.id
      end

    else
      can :read, :all
      can :create, User



     end
end

end
