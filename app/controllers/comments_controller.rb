class CommentsController < ApplicationController
	before_action :set_comment, only: [:show, :edit, :update, :destroy]

	def create
		@song = Song.find(params[:song_id])
		@comment = @song.comments.build(comment_params)
		@comment.user = current_user

		respond_to do |format|
      if @comment.save
        format.html { redirect_to @song, notice: 'Comment was successfully created.' }
        format.json { render json: @comment, status: :created, location: @comment }
      else
        format.html { render action: "new" }
        format.json { render json: @comment.errors, status: :unprocessable_entity }
      end
    end
	end

	def destroy
		@comment.destroy
    respond_to do |format|
      format.html { redirect_to comments_url, notice: 'Comment was successfully destroyed.' }
      format.json { head :no_content }
    end
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
