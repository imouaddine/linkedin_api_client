
module LinkedinApi
  module Request
    class GroupSearch

      def initialize(client, options={})
        @url = "people/~/group-memberships"
        @client = client
        @options = {}
        options.each do |key, value|
          @options[key.to_s.dasherize] = value
        end
      end

      def perform
        response = @client.get(@url, @options)
        Response::GroupSearch.new(response)
      end
    end
  end
end
