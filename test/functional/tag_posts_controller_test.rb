require 'test_helper'

class TagPostsControllerTest < ActionController::TestCase
  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:tag_posts)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create tag_posts" do
    assert_difference('TagPosts.count') do
      post :create, :tag_posts => { }
    end

    assert_redirected_to tag_posts_path(assigns(:tag_posts))
  end

  test "should show tag_posts" do
    get :show, :id => tag_posts(:one).to_param
    assert_response :success
  end

  test "should get edit" do
    get :edit, :id => tag_posts(:one).to_param
    assert_response :success
  end

  test "should update tag_posts" do
    put :update, :id => tag_posts(:one).to_param, :tag_posts => { }
    assert_redirected_to tag_posts_path(assigns(:tag_posts))
  end

  test "should destroy tag_posts" do
    assert_difference('TagPosts.count', -1) do
      delete :destroy, :id => tag_posts(:one).to_param
    end

    assert_redirected_to tag_posts_path
  end
end
