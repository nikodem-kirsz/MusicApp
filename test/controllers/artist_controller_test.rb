require 'test_helper'

class ArtistsControllerTest < ActionController::TestCase
	
	def setup
    @user = users(:niko)
  	@artist = artists(:dave)
	end

	test "should delete artist" do
    sign_in :user, @user
		delete :destroy, id: @artist
		assert_not flash.empty?
		assert_redirected_to artists_path
	end

	test "should update artist" do
    sign_in :user, @user
		patch :update, id: @artist, artist: { name: "example" }
		assert_not flash.empty?
		assert_redirected_to @artist
	end

	test "should get new" do
    sign_in :user, @user
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
    sign_in :user, @user
    get :edit, id: @artist.id
    assert_response :success
  end
end
