require 'test_helper'

class SongTest < ActiveSupport::TestCase

  def setup
		@artist = artists(:dave)
		@song = @artist.songs.build(title: "something")
	end

  test "title should be present"	do
  	@song.title = ""
  	assert_not @artist.valid?
  end

  test "title should be at most 30 characters" do
  	@song.title = "a" * 31
  	assert_not @song.valid?
  end

  test "artist should be present"	do
  	@song.artist = nil
  	assert_not @song.valid?
  end

end
