module LinkedinApi
  module API
    module Groups

      def group_memberships(options={})
        Request::GroupSearch.new(self, options).perform
      end

    end
  end
end