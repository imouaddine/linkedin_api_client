require 'hashie'
module LinkedinApi
  # @private
  module Middleware
    # @private
    module Response
      class Mashify < Faraday::Response::Middleware

        dependency do
          require 'json'
        end


        def on_complete(env)
          body = env[:body]
          unless body.strip.empty?
            body = ::JSON.parse(body)
            env[:body] = Hashie::Mash.new(body)
          end
        end
      end
    end
  end
end