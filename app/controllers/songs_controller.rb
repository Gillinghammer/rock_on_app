class SongsController < ApplicationController

  load_and_authorize_resource

  def index
    @songs = Song.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @songs }
    end
  end

  # GET /songs/1
  # GET /songs/1.json
  def show
    @band = Band.find(params[:band_id])
    @album = Album.find(params[:album_id])
    @song = Song.find(params[:id])

  end

  # GET /songs/new
  # GET /songs/new.json
  def new
    @band = Band.find(params[:band_id])
    @album = Album.find(params[:album_id])
    @song = Song.new
  end

  # GET /songs/1/edit
  def edit
    @song = Song.find(params[:id])
  end

  # POST /songs
  # POST /songs.json
  def create
    @song = Song.new(params[:song])
    @band = Band.find(params[:band_id])
    @album = Album.find(params[:album_id])
    if @song.save
      redirect_to band_album_song_path(@band, @album, @song), notice: "Song Added!"
    else
      render "new"
    end
  end

  # PUT /songs/1
  # PUT /songs/1.json
  def update
    @song = Song.find(params[:id])

    respond_to do |format|
      if @song.update_attributes(params[:song])
        format.html { redirect_to @song, notice: 'Song was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @song.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /songs/1
  # DELETE /songs/1.json
  def destroy
    @song = Song.find(params[:id])
    @song.destroy
  end
end
