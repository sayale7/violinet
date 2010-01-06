require 'test_helper'

class UserCommonsControllerTest < ActionController::TestCase
  def test_index
    get :index
    assert_template 'index'
  end
  
  def test_show
    get :show, :id => UserCommon.first
    assert_template 'show'
  end
  
  def test_new
    get :new
    assert_template 'new'
  end
  
  def test_create_invalid
    UserCommon.any_instance.stubs(:valid?).returns(false)
    post :create
    assert_template 'new'
  end
  
  def test_create_valid
    UserCommon.any_instance.stubs(:valid?).returns(true)
    post :create
    assert_redirected_to user_common_url(assigns(:user_common))
  end
  
  def test_edit
    get :edit, :id => UserCommon.first
    assert_template 'edit'
  end
  
  def test_update_invalid
    UserCommon.any_instance.stubs(:valid?).returns(false)
    put :update, :id => UserCommon.first
    assert_template 'edit'
  end
  
  def test_update_valid
    UserCommon.any_instance.stubs(:valid?).returns(true)
    put :update, :id => UserCommon.first
    assert_redirected_to user_common_url(assigns(:user_common))
  end
  
  def test_destroy
    user_common = UserCommon.first
    delete :destroy, :id => user_common
    assert_redirected_to user_commons_url
    assert !UserCommon.exists?(user_common.id)
  end
end
