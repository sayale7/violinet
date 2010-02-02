require 'test_helper'

class AssignTest < ActiveSupport::TestCase
  def test_should_be_valid
    assert Assign.new.valid?
  end
end
