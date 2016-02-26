require 'test_helper'

class UsersSignupTest < ActionDispatch::IntegrationTest

  def setup
    @user = User.new
    @user.username = "waeiawe"
    @user.email = "foo.bar@baz.qux"
    @user.password = "I<3rubysSyntax"
    @user.password_confirmation = "I<3rubysSyntax"
    @user.save
  end

  test "valid signup information" do
    get signup_path
    assert_difference ->{ User.count } do
      post_via_redirect users_path, @user
    end
    assert_template 'users/show'
  end
end
