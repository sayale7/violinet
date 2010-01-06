require 'test_helper'

class UserToGroupsControllerTest < ActionController::TestCase
  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:user_to_groups)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create user_to_group" do
    assert_difference('UserToGroup.count') do
      post :create, :user_to_group => { }
    end

    assert_redirected_to user_to_group_path(assigns(:user_to_group))
  end

  test "should show user_to_group" do
    get :show, :id => user_to_groups(:one).to_param
    assert_response :success
  end

  test "should get edit" do
    get :edit, :id => user_to_groups(:one).to_param
    assert_response :success
  end

  test "should update user_to_group" do
    put :update, :id => user_to_groups(:one).to_param, :user_to_group => { }
    assert_redirected_to user_to_group_path(assigns(:user_to_group))
  end

  test "should destroy user_to_group" do
    assert_difference('UserToGroup.count', -1) do
      delete :destroy, :id => user_to_groups(:one).to_param
    end

    assert_redirected_to user_to_groups_path
  end
end
