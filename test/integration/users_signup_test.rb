require 'test_helper'

class UsersSignupTest < ActionDispatch::IntegrationTest

  test "invalid signup information" do
  	get signup_path
  	assert_no_difference 'User.count' do
  		#The number of users before and after in the db should still be the same
  		post users_path, user: {
  			name: "",
  			email: "user@invalid",
  			password: "foo",
  			password_confirmation: "bar"
  		}
  	end
  	#An invalid submission should render a new form
  	assert_template 'users/new'
  end

  test "valid submission" do
  	get signup_path
  	assert_difference 'User.count' , 1 do
  		post_via_redirect users_path, user:{
  			name: "Bim",
  			email: "Bim@example.com",
  			password: "helloworld91",
  			password_confirmation: "helloworld91"

  		}
  	end
  	assert_template 'users/show'
    assert is_logged_in?
  end
end
