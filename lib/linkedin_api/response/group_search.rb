
module LinkedinApi
  module Response
    class GroupSearch < Record
      attr_reader :count

      attr_reader :total

      attr_reader :groups

      def initialize(raw_data)
        super
        @groups = []
        @values.each { |va| @groups << Model::GroupMembership.new(va) }
        remove_instance_variable("@values")
      end
    end
  end
end
