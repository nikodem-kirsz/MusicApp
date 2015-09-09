class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  def user
  	@user = User.find(params[:user_id])
    @artists = Artist.all.select { |a| a.user_id == @user.id }
    @artists.sort! { |a,b| b.created_at <=> a.created_at }
    @songs = Song.all.select { |s| s.artist.user_id == @user.id }
    @songs.sort! { |a,b| b.created_at <=> a.created_at }  
  end

  def statistics
  end
  
end