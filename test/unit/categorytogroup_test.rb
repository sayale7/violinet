require 'test_helper'

class CategorytogroupTest < ActiveSupport::TestCase
  def test_should_be_valid
    assert Categorytogroup.new.valid?
  end
end
