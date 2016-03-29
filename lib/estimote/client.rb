module Estimote
  class Client

    attr_reader :username, :password

    def initialize(username, password)
      @username = username
      @password = password
    end

    def beacons
      Estimote::Beacon.new(self)
    end

    def analytics
      Estimote::Analytic.new(self)
    end

  end
end
