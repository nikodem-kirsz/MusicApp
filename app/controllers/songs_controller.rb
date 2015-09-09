require 'will_paginate/array'

class SongsController < ApplicationController
  before_action :find_song,          only: [:show, :edit, :update, :destroy, :upvote, :downvote]
  before_action :find_artist,        only: [:new, :create]
  before_action :authenticate_user!, only: [:new, :create, :edit, :update, :destroy, :upvote, :downvote]
  before_action :correct_user,       only: [:edit, :update, :destroy]
  
  GENRES = ["Alternative", "Rock", "Blues", "Punk Rock", "Grunge", "New Wave", "Folk", "Electronic", "Metal", "Pop", "None"]

  def most_liked
    @songs = Song.most_liked 
  end

  def favorites
    @songs = Song.favorites(current_user)
  end

  def upvote
    @song.upvote_by current_user
    redirect_to :back
  end

  def downvote
    @song.downvote_by current_user
    redirect_to :back
  end

  def selected_genre
    @songs = Song.selected(params[:genre])
  end

  def search
    if params[:search].present?
      @songs = Song.search(params[:search])
    else
      @songs = Song.all.order('created_at DESC')
    end
  end

  def index
    @songs = Song.all.order("created_at DESC")
  end

  def show
    per_page = 9
    @songs = Song.selected(@song.genre).paginate(:page => params[:page], :per_page => per_page)
    # @most_liked_songs = Song.most_liked.first(4)
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

      def correct_user
        @song = Song.find(params[:id])
        redirect_to root_url unless @song.artist.user == current_user
      end

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