require 'test_helper'

class UsersSignupTest < ActionDispatch::IntegrationTest

  def setup
    @user_data = {username: "waeiawe", email: "foo.bar@baz.qux", password: "iamatestpassword1", password_confirmation: "iamatestpassword1"}
  end

  test "valid signup information" do
    get signup_path
    assert_difference 'User.count' do
      post_via_redirect users_path, user: @user_data
    end
    assert_template 'users/show'
  end
end
