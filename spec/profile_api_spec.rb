module LinkedinApi
  describe "client" do
    let(:client) { LinkedinApi::Client.new(token: ENV["LINKEDIN_TOKEN"], client_id: ENV["LINKEDIN_CLIENT_ID"], client_secret: ENV["LINKEDIN_CLIENT_SECRET"]) }

    describe ".current_profile" do

      it "returns current_profile" do
        response = client.current_profile
        expect(response).to be_a Model::Profile
        expect(response.first_name).to eq "Imad"
        expect(response.last_name).to eq "Mouaddine"
      end

    end
    describe ".people" do
      it "raise AccessDenier error if client doesn't have access to it" do
        expect {
          client.people(id: "5445")
        }.to raise_error LinkedinApi::Error::AccessDenied
      end
      xit "find people by id" do
        result = client.people(id: "21994521")
        expect(result.count).to eq 1
        expect(result.first.firstName).to eq "jeevan"
        expect(result.first.firstName).to eq "lobo"
      end

      xit "find people by url " do
        result = client.people(url: "www.linkedin.com/in/lobojeevan")
        puts result.inspect
      end
    end
  end
end