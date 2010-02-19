require 'test_helper'

class TagRelationshipTest < ActiveSupport::TestCase
  def test_should_be_valid
    assert TagRelationship.new.valid?
  end
end
