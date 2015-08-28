require 'test_helper'

class ArtistTest < ActiveSupport::TestCase

	def setup
		@artist = artists(:dave)
	end

  test "name should be at most 50 characters" do
    @artist.name = "a" * 51
    assert_not @artist.valid?
  end

  test "name should be present"	do
  	@artist.name = ""
  	assert_not @artist.valid?
  end

  test "description should be present"	do
  	@artist.description = ""
  	assert_not @artist.valid?
  end

  test "origin should be present"	do
  	@artist.origin = ""
  	assert_not @artist.valid?
  end

  test "genre should be present"	do
  	@artist.genre = ""
  	assert_not @artist.valid?
  end


end
