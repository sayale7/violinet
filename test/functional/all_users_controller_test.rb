require 'test_helper'

class AllUsersControllerTest < ActionController::TestCase
  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:all_users)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create all_users" do
    assert_difference('AllUsers.count') do
      post :create, :all_users => { }
    end

    assert_redirected_to all_users_path(assigns(:all_users))
  end

  test "should show all_users" do
    get :show, :id => all_users(:one).to_param
    assert_response :success
  end

  test "should get edit" do
    get :edit, :id => all_users(:one).to_param
    assert_response :success
  end

  test "should update all_users" do
    put :update, :id => all_users(:one).to_param, :all_users => { }
    assert_redirected_to all_users_path(assigns(:all_users))
  end

  test "should destroy all_users" do
    assert_difference('AllUsers.count', -1) do
      delete :destroy, :id => all_users(:one).to_param
    end

    assert_redirected_to all_users_path
  end
end
