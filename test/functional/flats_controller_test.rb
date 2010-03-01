require 'test_helper'

class FlatsControllerTest < ActionController::TestCase
  def test_index
    get :index
    assert_template 'index'
  end
  
  def test_show
    get :show, :id => Flat.first
    assert_template 'show'
  end
  
  def test_new
    get :new
    assert_template 'new'
  end
  
  def test_create_invalid
    Flat.any_instance.stubs(:valid?).returns(false)
    post :create
    assert_template 'new'
  end
  
  def test_create_valid
    Flat.any_instance.stubs(:valid?).returns(true)
    post :create
    assert_redirected_to flat_url(assigns(:flat))
  end
  
  def test_edit
    get :edit, :id => Flat.first
    assert_template 'edit'
  end
  
  def test_update_invalid
    Flat.any_instance.stubs(:valid?).returns(false)
    put :update, :id => Flat.first
    assert_template 'edit'
  end
  
  def test_update_valid
    Flat.any_instance.stubs(:valid?).returns(true)
    put :update, :id => Flat.first
    assert_redirected_to flat_url(assigns(:flat))
  end
  
  def test_destroy
    flat = Flat.first
    delete :destroy, :id => flat
    assert_redirected_to flats_url
    assert !Flat.exists?(flat.id)
  end
end
