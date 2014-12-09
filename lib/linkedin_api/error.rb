module LinkedinApi
  module Error
    class ClientError < Faraday::Error::ClientError
      attr_reader :wrapped_exception
    end

    # Raised when a 401 response status code is received
    class UnauthorizedError  < ClientError; end

    # Raised when a 403 response  status code is received
    class AccessDenied < ClientError
      attr_reader :message
      def initialize(response)
        @response = response
        if response[:body].respond_to?(:message)
          @message = response[:body].message
        end
      end
      def to_s
        "#{self.class.name}: #{@message}"
      end
    end

    # Raised when a 404 response  status code is received
    class RecordNotFound   < ClientError; end


    # Raised when for all other errors
    class NetworkError       < ClientError; end




  end
end
