require 'test_helper'

class BeaconTest < Minitest::Test

  def test_get_beacon_object
    client = Estimote::Client.new(ENV['ESTIMOTE_APP_KEY'], ENV['ESTIMOTE_APP_TOKEN'])
    assert_instance_of Estimote::Beacon, client.beacons
  end

  def test_get_collection
    client = Estimote::Client.new(ENV['ESTIMOTE_APP_KEY'], ENV['ESTIMOTE_APP_TOKEN'])
    assert_instance_of Array, client.beacons.collection
  end

  # id  = B9407F30-F5F8-466E-AFF9-25556B57FE6D:64528:26670
  # mac = c4a04faaae43
  def test_store_pedding_settings
    client = Estimote::Client.new(ENV['ESTIMOTE_APP_KEY'], ENV['ESTIMOTE_APP_TOKEN'])
    # fetch a valid beacon from our collection to store the settigns
    becon = client.beacons.collection.first
    client.beacons.store_settings(becon['id'], {})
  end

  def test_pending_settings
    client = Estimote::Client.new(ENV['ESTIMOTE_APP_KEY'], ENV['ESTIMOTE_APP_TOKEN'])
    assert_instance_of Array, client.beacons.pending_settings
  end

  def test_bad_authentication
    client = Estimote::Client.new("sapo", "cocas")
    assert_raises Estimote::Request::BadAuthentication do
      client.beacons.pending_settings
    end
  end

end
