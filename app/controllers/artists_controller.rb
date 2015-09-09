class ArtistsController < ApplicationController
  before_action :find_artist, only: [:show, :edit, :update, :destroy]
  before_action :authenticate_user!, only: [:new, :create, :edit, :update, :destroy]
  before_action :correct_user, only: [:edit, :update, :destroy]

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

      def correct_user
        @artist = Artist.find(params[:id])
        redirect_to root_url unless @artist.user == current_user
      end

      def find_artist
        @artist = Artist.find(params[:id])
      end

      def artist_params
        params.require(:artist).permit(:name, :image, :description, :origin, :allow_other_to_add_songs)
      end
end