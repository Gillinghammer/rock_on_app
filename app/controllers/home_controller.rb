class HomeController < ApplicationController
def home
  @recent_albums = Album.recent
  @songs = Song.all
  @bands = Band.all
  @comments = Comment.all
end
end