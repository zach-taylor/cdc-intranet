require 'test_helper'

class PasswordsControllerTest < ActionController::TestCase
  setup do
    @password = passwords(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:passwords)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create password" do
    assert_difference('Password.count') do
      post :create, :password => @password.attributes
    end

    assert_redirected_to password_path(assigns(:password))
  end

  test "should show password" do
    get :show, :id => @password.to_param
    assert_response :success
  end

  test "should get edit" do
    get :edit, :id => @password.to_param
    assert_response :success
  end

  test "should update password" do
    put :update, :id => @password.to_param, :password => @password.attributes
    assert_redirected_to password_path(assigns(:password))
  end

  test "should destroy password" do
    assert_difference('Password.count', -1) do
      delete :destroy, :id => @password.to_param
    end

    assert_redirected_to passwords_path
  end
end
