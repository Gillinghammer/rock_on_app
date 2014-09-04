class ReportsController < ApplicationController
 
  def create
    @report = Report.new comment_id: (params[:comment_id])


    
    @song = Song.find(params[:song_id])

    if @report.save
      redirect_to band_album_song_path(@song.album.band.id, @song.album.id, @song), notice: "Comment Flagged!"
    else
      render "new"
    end

  end

end