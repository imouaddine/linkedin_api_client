module LinkedinApi
  module Middleware
    module Request
      class Format < Faraday::Middleware
        def call(env)
          env[:request_headers]['x-li-format'] = @format
          @app.call(env)
        end

        def initialize(app, format="json")
          @app = app
          @format = format
        end
      end
    end
  end
end