class AlbumsController < ApplicationController
  def new
    #TODO Authentication to make sure user is logged in
    @album = Album.new

  end

  def create
    @album = Album.new(params[:album])
    @album.user_id = current_user.id

    if @album.save
      redirect_to albums_path, notice: "Album Created."
    else
      render "new"
    end

  end

  def edit
@album = Album.find(params[:id])
  end

  def update
    @album = Album.find(params[:id])

    respond_to do |format|
      if @album.update_attributes(params[:album])
        format.html { redirect_to @album, notice: 'Album was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @album.errors, status: :unprocessable_entity }
      end
    end
  end

  def index
    @albums = Album.all
  end

  def destroy
    @album = Album.find(params[:id])
    @album.destroy
  end
end
