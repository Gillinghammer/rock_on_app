class Ability
  include CanCan::Ability

  def initialize(user)
    user ||= User.new

    # alias_action :create, :read, :edit, :update, :destroy, :to => :crud

    if user.role? :admin
      can :manage, :all
    elsif user.persisted?

      can :read, :all


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
        comment && comment.song && comment.song.album && comment.song.album.band && comment.song.album.band.user == user
      end

    else
      can :read, :all
      cannot :read, User

     end
end

end
