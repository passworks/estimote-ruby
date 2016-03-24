require 'test_helper'

class BeaconTest < Minitest::Test
  def test_get_beacon_collection
    assert_instance_of Array, Estimote::Beacon.new().collection
  end
end
