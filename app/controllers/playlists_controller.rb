class PlaylistsController < ApplicationController
  load_and_authorize_resource

  def index
    @playlists = Playlist.all
  end

  def show
    @playlist = Playlist.find(params[:id])
  end

  def new
    @playlist = Playlist.new
  end

  def create
    @playlist = current_user.playlists.new (params[:playlist])
    if @playlist.save
      redirect_to playlists_path, notice: "Playlist created"
    else
      render "new"
    end
  end

  def edit
    @playlist = Playlist.find(params[:id])
  end

  def update

  end

  def destroy

  end

end