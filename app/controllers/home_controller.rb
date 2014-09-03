class HomeController < ApplicationController
def home
  @recent_albums = Album.recent
  @popular_songs = Song.popular
  @newest_band = Band.newest.first
  @comments = Comment.all

  @q = Band.search(params[:q])
  @bands = @q.result(distinct: true)


end
end