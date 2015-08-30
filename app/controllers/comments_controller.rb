class CommentsController < ApplicationController
	before_action :set_comment, only: [:show, :edit, :update, :destroy]
  before_action :authenticate_user!, only: [:create, :destroy]

	def create
		@song = Song.find(params[:song_id])
		@comment = @song.comments.build(comment_params)
		@comment.user = current_user
    
    if @comment.save
      redirect_to @song
    else
      render 'new'
    end
	end

	def destroy
    @song = Song.find(params[:song_id])
		@comment.destroy
    redirect_to @song
	end

  def edit
    @comment = Comment.find(params[:id])
  end

  def update
    @comment = Comment.update(comment_params)
    if @comment.save
      redirect_to @comment.song
    else
      redirect_to @comment.song
    end
  end

	private

    def set_comment
      @comment = Comment.find(params[:id])
    end

    def comment_params
      params.require(:comment).permit(:song_id, :body, :user_id)
    end
end
