RSpec.describe "Project root paths ", type: :request do
  let(:user) { User.create!(email: "test@aol.com", password: "password") }

  describe "Access to CMM app root page" do
    describe "Public access with no login" do
      it "denies access to root and routes to login page" do
        get root_path
        expect(response).to redirect_to new_user_session_path
      end
    end

    describe "User access with login" do
      before do
        sign_in user
      end

      it "allows access to root path" do
        get root_path
        expect(response).to_not redirect_to new_user_session_path
      end
    end
  end
end
