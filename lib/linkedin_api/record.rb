module LinkedinApi

    class Record

      def initialize(raw_data)
        raw_data.each_pair do |key, value|
          variable_name = key.gsub(/_/i, "").underscore
          instance_variable_set("@#{variable_name}", value)
        end
      end
    end

end