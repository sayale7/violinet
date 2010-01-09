require 'test_helper'

class CategorytogroupsControllerTest < ActionController::TestCase
  def test_index
    get :index
    assert_template 'index'
  end
  
  def test_show
    get :show, :id => Categorytogroup.first
    assert_template 'show'
  end
  
  def test_new
    get :new
    assert_template 'new'
  end
  
  def test_create_invalid
    Categorytogroup.any_instance.stubs(:valid?).returns(false)
    post :create
    assert_template 'new'
  end
  
  def test_create_valid
    Categorytogroup.any_instance.stubs(:valid?).returns(true)
    post :create
    assert_redirected_to categorytogroup_url(assigns(:categorytogroup))
  end
  
  def test_edit
    get :edit, :id => Categorytogroup.first
    assert_template 'edit'
  end
  
  def test_update_invalid
    Categorytogroup.any_instance.stubs(:valid?).returns(false)
    put :update, :id => Categorytogroup.first
    assert_template 'edit'
  end
  
  def test_update_valid
    Categorytogroup.any_instance.stubs(:valid?).returns(true)
    put :update, :id => Categorytogroup.first
    assert_redirected_to categorytogroup_url(assigns(:categorytogroup))
  end
  
  def test_destroy
    categorytogroup = Categorytogroup.first
    delete :destroy, :id => categorytogroup
    assert_redirected_to categorytogroups_url
    assert !Categorytogroup.exists?(categorytogroup.id)
  end
end
