module LinkedinApi
  module Profile
    def people(options)
      get("people", options)
    end

    def current_user
      get("people/~")
    end

  end
end