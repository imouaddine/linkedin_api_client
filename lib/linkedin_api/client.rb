module LinkedinApi
  class Client

    LINKED_API_URL = "https://api.linkedin.com/v1"
    attr_reader :token, :client_id, :client_secret

    include API::Profile
    include API::Groups

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
        connection.response :json
        connection.adapter  *Faraday.default_adapter
      end
    end
  end
end