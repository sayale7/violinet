require 'test_helper'

class GroupCategoriesControllerTest < ActionController::TestCase
  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:group_categories)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create group_category" do
    assert_difference('GroupCategory.count') do
      post :create, :group_category => { }
    end

    assert_redirected_to group_category_path(assigns(:group_category))
  end

  test "should show group_category" do
    get :show, :id => group_categories(:one).to_param
    assert_response :success
  end

  test "should get edit" do
    get :edit, :id => group_categories(:one).to_param
    assert_response :success
  end

  test "should update group_category" do
    put :update, :id => group_categories(:one).to_param, :group_category => { }
    assert_redirected_to group_category_path(assigns(:group_category))
  end

  test "should destroy group_category" do
    assert_difference('GroupCategory.count', -1) do
      delete :destroy, :id => group_categories(:one).to_param
    end

    assert_redirected_to group_categories_path
  end
end
