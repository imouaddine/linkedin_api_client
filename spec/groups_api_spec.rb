require "spec_helper"

module LinkedinApi
  describe "client" do
    let(:client) { Client.new(token: ENV["LINKEDIN_TOKEN"], client_id: ENV["LINKEDIN_CLIENT_ID"], client_secret: ENV["LINKEDIN_CLIENT_SECRET"]) }

    describe ".group_memberships" do

      it "returns the group memberships of the current user" do
        response = client.group_memberships
        expect(response).to be_a(Response::GroupSearch)
        expect(response.total).to eq 44
        expect(response.count).to eq 10
        expect(response.groups.count).to eq 10
        expect(response.groups.first).to be_a Model::GroupMembership
        expect(response.groups.first.group).to be_a Model::Group

      end

      it "returns group memberships where the user is a member of " do
        response = client.group_memberships(:membership_state => "member")
        expect(response.total).to eq 44
        expect(response.count).to eq 10
      end


    end
  end
end
