require 'test_helper'

class ArtistsControllerTest < ActionController::TestCase
	
	def setup
  	@artist = artists(:dave)
	end

	test "should delete artist" do
		delete :destroy, id: @artist
		assert_not flash.empty?
		assert_redirected_to root_url
	end

	test "should update artist" do
		patch :update, id: @artist, artist: { name: "example" }
		assert_not flash.empty?
		assert_redirected_to @artist
	end

	test "should get new" do
    get :new
    assert_response :success
  end

  test "should get index" do
    get :index
    assert_response :success
  end

  test "should get show" do
    get :show, id: @artist.id
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @artist.id
    assert_response :success
  end
end
