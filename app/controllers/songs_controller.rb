class SongsController < ApplicationController
	before_action :find_song, only: [:show, :edit, :update, :destroy]

	def index
		@songs = Song.all.order("created_at DESC")
	end

	def new
		@song = Song.new
	end

	def create
		@song = Song.new(song_params)
		if @song.save
			redirect_to @song, notice: "New song addded succesfully!"
		else
			render 'new'
		end
	end

	def edit
	end

	def update
		if @song.update(song_params)
			redirect_to @pin, notice: "Song updated succesfully"
		else
			render 'edit'
		end
	end

	def destroy
		@song.destroy
		redirect_to root_path
	end

		private

			def find_song
				@song = Song.find(params[:id])
			end

			def song_params
				params.require(:song).permit(:title)
			end
end