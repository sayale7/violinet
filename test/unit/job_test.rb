require 'test_helper'

class JobTest < ActiveSupport::TestCase
  def test_should_be_valid
    assert Job.new.valid?
  end
end
