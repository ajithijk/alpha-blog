require 'test_helper'

class SignupUsersTest < ActionDispatch::IntegrationTest

	test "new user should be able to signup" do
		get signup_path
		assert_template 'users/new'
		assert_difference 'User.count', 1 do
			post_via_redirect users_path, user: {username: "testuser", email: "testuser@example.com", password: "test"}
		end
		assert_template 'users/show'
		assert_match	"testuser", response.body
	end
end
