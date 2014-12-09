module LinkedinApi
  module Middleware
    module Request
      class Oauth2 < Faraday::Middleware
        def call(env)
          env[:request_headers]['Authorization'] = "Bearer #{@access_token}"
          @app.call(env)
        end


        def initialize(app, access_token)
          @app, @access_token = app, access_token
        end
      end
    end
  end
end