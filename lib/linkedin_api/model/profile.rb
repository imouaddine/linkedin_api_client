module LinkedinApi
  module Model
    class Profile < Record
      attr_reader :first_name, :last_name
    end
  end
end