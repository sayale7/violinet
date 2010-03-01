require 'test_helper'

class FlatTest < ActiveSupport::TestCase
  def test_should_be_valid
    assert Flat.new.valid?
  end
end
