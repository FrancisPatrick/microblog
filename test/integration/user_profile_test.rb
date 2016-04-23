require 'test_helper'

class UserProfileTest < ActionDispatch::IntegrationTest
  # test "the truth" do
  #   assert true
  # end
  include ApplicationHelper
  def setup
  	@user = users(:francis)
  end

  test "Profile display" do
  	get user_path(@user)
  	assert_template 'users/show'
  	assert_select 'title', full_title(@user.name)
  	assert_select 'h1', text: @user.name
  	assert_select 'h1>img'
  	assert_match @user.microposts.count.to_s, response.body
  	assert_select 'div.pagination'
  	@user.microposts.paginate(page: 1).each do |micropost|
  		assert_match micropost.content, response.body
  	end
  end
end
