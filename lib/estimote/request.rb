module Estimore

  def request(method, url='/', args={}, headers={})
    request_url = "#{base_url}#{url}"
    headers     = headers.merge({ accept: "application/json" }}
    parameters  = args.merge({
      headers: headers
    })
    RestClient::Request.execute(method: method, url: request_url, parameters)
  end

  def base_url
    "https://cloud.estimote.com/v1"
  end
end
