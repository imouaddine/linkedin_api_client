require 'hashie'
module LinkedinApi
  # @private
  module Middleware
    # @private
    module Response
      class Json < Faraday::Response::Middleware

        dependency do
          require 'json'
        end


        def on_complete(env)
          body = env[:body]
          unless body.strip.empty?
            body = ::JSON.parse(body)
            env[:body] = body
          end
        end
      end
    end
  end
end