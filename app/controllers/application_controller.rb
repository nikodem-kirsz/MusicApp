class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  def content
  	@artists = Artist.all.select { |a| a.user_id == current_user.id }
  	@artists.sort! { |a,b| b.created_at <=> a.created_at }
  	@songs = Song.all.select { |s| s.artist.user_id == current_user.id }
  	@songs.sort! { |a,b| b.created_at <=> a.created_at }	
  end

end
