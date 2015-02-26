require 'test_helper'

class Web::UsersControllerTest < ActionController::TestCase
  setup do
    @user = create :user
  end

  test 'new' do
    get :new
    assert_response :success
  end

  test 'create ok' do
    post :create, user: { email: @user.email, password: @user.password }
    assert_response :redirect
    assert { signed_in? }
  end

  test 'create login user registrated via github' do
    user = create :user, password_digest: nil
    post :create, user: { email: user.email, password: '123' }
    assert_response :success
    assert { !signed_in? }
  end

  test 'create wrong password' do
    post :create, user: { email: @user.email, password: '123' }
    assert_response :success
    assert { !signed_in? }
  end
end
