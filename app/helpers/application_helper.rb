module ApplicationHelper

	def content(user)
  	artists = Artist.all.select { |a| a.user_id == user.id }
  	songs = Song.all.select { |s| s.user_id == user.id }
  	{ :artists => artists, :songs => songs }
  end

end
