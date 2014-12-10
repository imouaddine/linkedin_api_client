module LinkedinApi
  module Model
    class GroupMembership < Record
      attr_accessor :key, :membership_state, :group

      def initialize(raw_data)
        super
        @group = Group.new(@group)
      end
    end
  end
end