require 'test_helper'

class UsersEditTest < ActionDispatch::IntegrationTest
  # test "the truth" do
  #   assert true
  # end
  def setup
  	@user = users(:francis)
  end

  test "unsuccessful edit" do
  	get edit_user_path(@user)
  	assert_template 'users/edit'
  	patch user_path(@user), user: { name: "",
  		email: "foo@invalid",
  		password: "foo",
  		password_confirmation: "bar"}
  	assert_template 'users/edit'
  end
  
end