require 'base64'
require 'json'

module Estimote
  module Request

    class ConnectionError < StandardError; end;
    class BadAuthentication < StandardError; end;
    class BadAuthentication < StandardError; end;

    def request(method, url='/', payload={}, headers={})
      request_url = "#{base_url}#{url}"
      headers     = headers.merge({
        accept: "application/json",
        authorization: "Basic #{authorization}"
      })

      puts "=" * 80
      puts "request_url: #{request_url}"
      puts "headers: #{headers}"
      puts "payload: #{payload}"
      puts "=" * 80

      begin
        response = RestClient::Request.execute(method: method, url: request_url, payload: payload, headers: headers)
        handle_response(response)
      rescue => e
        handle_response(e.response)
      end

    end

    def base_url
      "https://cloud.estimote.com/v1"
    end

    def authorization
      Base64.encode64("#{client.username}:#{client.password}").chomp
    end

    private
      def handle_response(response)
        case response.code
        when (200..299)
          JSON.parse(response) if response.body != ""
        when 401, 403
          raise BadAuthentication.new("Wrong authentication credentials")
        end
      end

  end
end
