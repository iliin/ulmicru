require 'test_helper'

class Web::Admin::VideosControllerTest < ActionController::TestCase
  setup do
    @video = create :content_video
    admin = create :admin
    sign_in admin
    @exceptions_attributes = ['id', 'created_at', 'updated_at']
  end

  test 'should get new' do
    get :new
    assert_response :success, @response.body
  end

  test 'should get index' do
    get :index
    assert_response :success, @response.body
  end

  test 'should get index with search' do
    get :index, search: @video.link
    assert_response :success, @response.body
  end

  test 'should get index without instances' do
    Content::Video.all.map &:destroy
    get :index
    assert_response :success, @response.body
  end

  test 'should create video' do
    attributes = attributes_for :video
    post :create, video: attributes
    assert_response :redirect, @response.body
    assert_redirected_to admin_videos_path
    video = Content::Video.last
    video.attributes.keys.except(*@exceptions_attributes).each do |key|
      assert_equal attributes[key.to_sym], video.send(key), key
    end
  end

  test 'should get edit' do
    get :edit, id: @video
    assert_response :success, @response.body
  end

  test 'should patch update' do
    attributes = attributes_for :video
    patch :update, video: attributes, id: @video
    assert_response :redirect, @response.body
    assert_redirected_to edit_admin_video_path @video
    @video.reload
    @video.attributes.keys.except(*@exceptions_attributes).each do |key|
      assert_equal attributes[key.to_sym], @video.send(key), key
    end
  end

  test 'should delete destroy' do
    delete :destroy, id: @video
    @video.reload
    assert @video.removed?
  end
end
