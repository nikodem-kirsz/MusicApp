require 'test_helper'

class SongsControllerTest < ActionController::TestCase

  def setup
    @user = users(:niko)
  	@artist = artists(:dave)
  	@song = @artist.songs.build(title: "dRAIN YOU")
    @song.save
	end

	test "should delete song" do
    sign_in :user, @user
		delete :destroy, id: @song
		assert_not flash.empty?
		assert_redirected_to root_url
	end

	test "should update song" do
    sign_in :user, @user
		patch :update, id: @song, song: { title: "aneurysm" }
		assert_not flash.empty?
		assert_redirected_to @song
	end

	# test "should get new" do
 #    get :new
 #    assert_response :success
 #  end

  test "should get index" do
    get :index
    assert_response :success
  end

  test "should get show" do
    get :show, id: @song.id
    assert_response :success
  end

  test "should get edit" do
    sign_in :user, @user
    get :edit, id: @song.id
    assert_response :success
  end
end