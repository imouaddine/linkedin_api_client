require "linkedin_api/version"

require 'faraday'
require "linkedin_api/middleware/request/oauth2"
require "linkedin_api/middleware/request/format"
require "linkedin_api/middleware/response/mashify"
require "linkedin_api/middleware/response/raise_error"

require "linkedin_api/error"
require "linkedin_api/profile"



module LinkedinApi

  class Client

    LINKED_API_URL = "https://api.linkedin.com/v1"
    attr_reader :token, :client_id, :client_secret

    include Profile

    def initialize(token: ,client_id:, client_secret:)
      @client_secret = client_secret
      @client_id = client_id
      @token = token
    end

    def get(url, options={})
      response = connection.get url, options
      response.body
    end

    private
    def connection
      @connection ||= Faraday.new(url: LINKED_API_URL) do |connection|
        connection.request  :url_encoded
        connection.request  :oauth2, token
        connection.request  :format, "json"

        connection.response :raise_error
        connection.response :mashify
        connection.adapter  *Faraday.default_adapter
      end
    end
  end

  Faraday::Request.register_middleware  :oauth2   => lambda { LinkedinApi::Middleware::Request::Oauth2 }, \
                                        :format => -> { LinkedinApi::Middleware::Request::Format }

  Faraday::Response.register_middleware :mashify => -> { LinkedinApi::Middleware::Response::Mashify}, \
                                        :raise_error => -> {LinkedinApi::Middleware::Response::RaiseError }


end
