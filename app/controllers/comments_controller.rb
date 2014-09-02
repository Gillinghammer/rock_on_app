    class CommentsController < ApplicationController

      def create
        @comment_hash = params[:comment]
        @obj = @comment_hash[:commentable_type].constantize.find(@comment_hash[:commentable_id])
        # Not implemented: check to see whether the user has permission to create a comment on this object
        @comment = Comment.new(commentable: @obj, user_id: current_user.id, body: @comment_hash[:body])
        if @comment.save
          
          redirect_to song_path(params[:song_id])
        else
          render new
        end
      end

      def destroy
        @comment = Comment.find(params[:id])
        @comment.destroy

        if @comment.destroy
          redirect_to song_path(params[:song_id])
        else
          render new
        end

      end

    end