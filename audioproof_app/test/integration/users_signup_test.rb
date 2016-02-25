require 'test_helper'

class UsersSignupTest < ActionDispatch::IntegrationTest

  def setup
    @user = users(:test)
  end

  test "valid signup information" do
    get signup_path
    assert_difference 'User.count' do
      post_via_redirect users_path, @user
    end
    assert_template 'users/show'
  end
end
