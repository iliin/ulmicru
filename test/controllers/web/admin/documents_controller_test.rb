require 'test_helper'

class Web::Admin::DocumentsControllerTest < ActionController::TestCase
  setup do
    @document = create :document
    admin = create :admin
    sign_in admin
    @exceptions_attributes = ['id', 'created_at', 'updated_at', 'file']
  end

  test 'should get new' do
    get :new
    assert_response :success, @response.body
  end

  test 'should get index' do
    get :index
    assert_response :success, @response.body
  end

  test 'should get index without instances' do
    Document.all.map &:destroy
    get :index
    assert_response :success, @response.body
  end

  test 'should create document' do
    attributes = attributes_for :document
    post :create, document: attributes
    assert_response :redirect, @response.body
    assert_redirected_to admin_documents_path
    document = Document.last
    document.attributes.keys.except(*@exceptions_attributes).each do |key|
      assert_equal attributes[key.to_sym], document.send(key), key
    end
  end

  test 'should get edit' do
    get :edit, id: @document
    assert_response :success, @response.body
  end

  test 'should patch update' do
    attributes = attributes_for :document
    patch :update, document: attributes, id: @document
    assert_response :redirect, @response.body
    assert_redirected_to edit_admin_document_path @document
    @document.reload
    @document.attributes.keys.except(*@exceptions_attributes).each do |key|
      assert_equal attributes[key.to_sym], @document.send(key), key
    end
  end

  test 'should delete destroy' do
    delete :destroy, id: @document
    @document.reload
    assert @document.removed?
  end
end
