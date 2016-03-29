require "estimote/request"

module Estimote
  class Beacon

    include Estimote::Request

    attr_reader :client

    def initialize(client)
      @client = client
    end

    def collection
      request(:get, "/beacons")
    end

    def store_settings(mac, settings={})
      request(:post, "/beacons/#{mac}/pending_settings")
    end

    def pending_settings
      request(:get, "/beacons/pending_settings")
    end

  end
end
