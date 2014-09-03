class HomeController < ApplicationController
def home
  @recent_albums = Album.recent
  @popular_songs = Song.popular
  @recent_bands = Band.recent
  @comments = Comment.all
end
end