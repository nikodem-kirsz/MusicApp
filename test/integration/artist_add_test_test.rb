require 'test_helper'

class ArtistAddTestTest < ActionDispatch::IntegrationTest

	def setup
		@user = users(:niko)
	end

	test "unlogged user adds new artist" do
		get new_artist_path
		assert_no_difference 'Artist.count', 1 do
			post artists_path,  artist: { name: "Name", image: "1.jpg", description: "desc", origin: "WA", genres: "Rock" }
		end
		assert_not flash.empty?
		assert_template 'artists/show'
	end

	test "logged user adds new artist with lacking data and then corrects" do
		post user_session_path, user: { email: 'n@email.com', password: 'password' }
		get new_artist_path
		assert flash.empty?
		assert_template 'artists/new'
		assert_no_difference 'Artist.count', 1 do
			post artists_path,  artist: { name: "", image: "1.jpg", description: "desc", origin: "WA", genres: "Rock" }
		end
		assert_template 'artists/new'
		assert_difference 'Artist.count', 1 do
			post new_artist_path,  artist: { name: "Name", image: "1.jpg", description: "desc", origin: "WA", genres: "Rock" }
		end
		assert_template 'artists/show'
	end

	test "log in and add artist with redirect" do
		get new_artist_path
		assert_not flash.empty?
		assert_template 'users/sign'
		post_via_redirect '/users/sign_in', user: { email: 'n@email.com', password: 'password' }
		assert_template 'artists/new'
		assert_difference 'Artist.count', 1 do
			post new_artist_path,  artist: { name: "Name", image: "1.jpg", description: "desc", origin: "WA", genres: "Rock" }
		end
		assert_template 'artists/show'
	end
		
end
