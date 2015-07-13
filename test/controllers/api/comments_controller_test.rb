require 'test_helper'

class Api::CommentsControllerTest < ActionController::TestCase
  setup do
    user = create :user
    @comment = create :comment
    sign_in user
  end

  test 'should post create' do
    count = Comment.count
    attributes = attributes_for :comment
    post :create, comment: attributes
    assert_response :success, @response.body
    assert_equal count + 1, Comment.count
    assert_equal Comment.last.text, attributes[:text]
  end
end
