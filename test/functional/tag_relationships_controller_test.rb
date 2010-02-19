require 'test_helper'

class TagRelationshipsControllerTest < ActionController::TestCase
  def test_index
    get :index
    assert_template 'index'
  end
  
  def test_show
    get :show, :id => TagRelationship.first
    assert_template 'show'
  end
  
  def test_new
    get :new
    assert_template 'new'
  end
  
  def test_create_invalid
    TagRelationship.any_instance.stubs(:valid?).returns(false)
    post :create
    assert_template 'new'
  end
  
  def test_create_valid
    TagRelationship.any_instance.stubs(:valid?).returns(true)
    post :create
    assert_redirected_to tag_relationship_url(assigns(:tag_relationship))
  end
  
  def test_edit
    get :edit, :id => TagRelationship.first
    assert_template 'edit'
  end
  
  def test_update_invalid
    TagRelationship.any_instance.stubs(:valid?).returns(false)
    put :update, :id => TagRelationship.first
    assert_template 'edit'
  end
  
  def test_update_valid
    TagRelationship.any_instance.stubs(:valid?).returns(true)
    put :update, :id => TagRelationship.first
    assert_redirected_to tag_relationship_url(assigns(:tag_relationship))
  end
  
  def test_destroy
    tag_relationship = TagRelationship.first
    delete :destroy, :id => tag_relationship
    assert_redirected_to tag_relationships_url
    assert !TagRelationship.exists?(tag_relationship.id)
  end
end
