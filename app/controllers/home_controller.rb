class HomeController < ApplicationController
  def home
    @recent_albums = Album.recent_albums
    @popular_songs = Song.popular
    @newest_band = Band.newest.first
    @comments = Comment.all
  end
end