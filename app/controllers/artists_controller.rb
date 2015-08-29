class ArtistsController < ApplicationController
	before_action :find_artist, only: [:show, :edit, :update, :destroy]
	before_action :authenticate_user!, only: [:new, :create, :edit, :update, :destroy]

	def my_content
  	content = content(current_user)
  	@artists = content[:artists]
  	@songs = content[:songs]
  end

	def index
		@artists = Artist.all.order("created_at DESC")
	end

	def show
	end

	def new
		@artist = current_user.artists.build
	end

	def create
		@artist = current_user.artists.build(artist_params)
		if @artist.save
			redirect_to @artist, notice: "New artist added succesfully"
		else
			render 'new'
		end
	end

	def edit
	end

	def update
		if @artist.update(artist_params)
			redirect_to @artist, notice: "Artist updated succesfully"
		else
			render 'edit'
		end
	end

	def destroy
		@artist.destroy
		redirect_to artists_path, notice: "Artist removed succesfully"
	end

		private

			def logged_in?
				unless !current_user.nil?
					flash[:danger] = "You must be logged in to add content"
					redirect_to new_user_session_url
				end
				
			end

			def find_artist
				@artist = Artist.find(params[:id])
			end

			def artist_params
				params.require(:artist).permit(:name, :image, :description, :origin)
			end
end
