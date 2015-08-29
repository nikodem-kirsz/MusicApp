class SongsController < ApplicationController
	before_action :find_song, only: [:show, :edit, :update, :destroy]
	before_action :find_artist, only: [:new, :create]
	
	GENRES = ["Alternative", "Rock", "Blues", "Punk Rock", "Grunge", "New Wave", "Folk", "Electronic", "Metal", "None"]

	def selected_genre
		@songs = Song.selected(params[:genre])
	end

	def index
		@songs = Song.all.order("created_at DESC")
	end

	def show
	end

	def new
		@song = @artist.songs.new
	end

	def create
		@song = @artist.songs.build(song_params)
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
			redirect_to @song
			flash[:info] = "Song updated succesfully"
		else
			render 'edit'
		end
	end

	def destroy
		@song.destroy
		flash[:success] = "Song deleted succesfully"
		redirect_to root_url
	end

		private

			def find_song
				@song = Song.find(params[:id])
			end

			def find_artist
				@artist = Artist.find(params[:artist_id])
			end

			def song_params
				params.require(:song).permit(:title, :genre, :image, :mp3)
			end
end