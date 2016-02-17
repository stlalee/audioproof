require 'test_helper'

class CommentTest < ActiveSupport::TestCase

  def setup
    @user = users(:michael)
    @post = posts(:test)
    @comment = Comment.new(comment_body: "Lorem ipsum", user_id: @user.id, post_id: @post.id)
  end

  test "comment body is valid" do
    assert @comment.valid?
  end

  test "user id is valid" do
    @comment.user_id = nil
    assert_not @comment.valid?
  end

  test "post id is valid" do
    @comment.post_id = nil
    assert_not @comment.valid?
  end

  test "content should be present" do
    @comment.comment_body = "   "
    assert_not @comment.valid?
  end

  test "content should be at most 256 characters" do
    @comment.comment_body = "a" * 257
    assert_not @comment.valid?
  end
end
