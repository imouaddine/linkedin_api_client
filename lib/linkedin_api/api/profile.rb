module LinkedinApi
  module API
    module Profile
      def people(options)
        get("people", options)
      end

      def current_user
        response = get("people/~")
        Model::Profile.new(response)
      end

      alias_method :current_profile, :current_user
    end
  end
end