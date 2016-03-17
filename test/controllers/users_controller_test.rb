require 'test_helper'

class UsersControllerTest < ActionController::TestCase
  
  def setup
  	@user = users(:francis)
  end

  test "should get new" do
    get :new
    assert_response :success
    assert_select "title", "Sign up | MicroBlog"
  end

  test "should redirect edit when not logged in" do
  	get :edit, id: @user
  	assert_not flash.empty?
  	assert_redirected_to login_url
  end

end
