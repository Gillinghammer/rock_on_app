    class CommentsController < ApplicationController

      def create
        @comment_hash = params[:comment]
        @obj = @comment_hash[:commentable_type].constantize.find(@comment_hash[:commentable_id])
        # Not implemented: check to see whether the user has permission to create a comment on this object
        @comment = Comment.new(commentable: @obj, user_id: current_user.id, body: @comment_hash[:body])

        @band = Band.find(params[:band_id])
        @album = Album.find(params[:album_id])
        @song = Song.find(params[:song_id])

        if @comment.save
          redirect_to band_album_song_path(@band, @album, @song)
        else
          render new
        end
      end

      def destroy

        @comment = Comment.find(params[:id])
        authorize! :destroy, @comment
        @comment.destroy

        @band = Band.find(params[:band_id])
        @album = Album.find(params[:album_id])
        @song = Song.find(params[:song_id])


        if @comment.destroy
          redirect_to band_album_song_path(@band, @album, @song)
        else
          render new
        end

      end

    end