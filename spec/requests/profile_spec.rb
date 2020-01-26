RSpec.describe "Profiles", type: :request do

  let(:user) { User.create!(email: "test@aol.com", password: "password") }
  let(:profile) { Profile.create! first_name: "Al", last_name: "Johnson", user: user }
  let(:valid_profile_attributes) { {first_name: "test name", last_name: "test name", bio: "test bio", user_id: user.id} }
  let(:invalid_profile_attributes) { {first_name: nil, last_name: "test name", bio: "test bio", user_id: user.id} }

  describe "GET user_profile_path - profile page" do
    before do
      sign_in user
    end

    describe "when user has a profile" do
      it "shows users profile" do
        get user_profile_path({id: profile.id, user_id: user.id})

        expect(response).to have_http_status(:success)
        expect(response).to render_template(:show)
      end
    end

    describe "when user does not have a profile" do
      it "raises error" do
        expect{ get user_profile_path({id: nil, user_id: user.id}) }.to raise_error(ActionController::UrlGenerationError)
      end
    end
  end

  describe "POST create new_user_profile_path" do
    before do
      sign_in user
    end

    describe "with valid params" do
      it "new_user_profile_path creates a Profile and renders show page" do
        get new_user_profile_path(user_id: user.id)
        expect(response).to render_template(:new)

        post user_profiles_path(profile: valid_profile_attributes, user_id: user.id)

        expect(response).to have_http_status(:success)
        expect(response).to render_template(:show)
        expect(response.body).to include("profile-view")
      end

      it "creates a new Profile" do
        expect {
          post user_profiles_path(profile: valid_profile_attributes, user_id: user.id)
        }.to change(Profile, :count).by(1)
      end

      it "assigns a newly created profile as @profile" do
        post user_profiles_path(profile: valid_profile_attributes, user_id: user.id)
        expect(assigns(:profile)).to be_a(Profile)
        expect(assigns(:profile)).to be_persisted
      end
    end

    describe "with invalid params" do
      it "assigns a newly created but unsaved profile as @profile" do
        post user_profiles_path(profile: invalid_profile_attributes, user_id: user.id)
        expect(assigns(:profile)).to be_a_new(Profile)
      end

      it "re-renders the 'new' template" do
        post user_profiles_path(profile: invalid_profile_attributes, user_id: user.id)
        expect(response).to render_template(:new)
      end
    end
  end

  describe "PUT update" do
    # before { put user_profile_path(profile) }
    before do
      sign_in user
    end

    describe "with valid params" do
      let(:new_attributes) {
        {first_name: 'Star', last_name: 'Dust', bio: 'Amazing'}
      }

      it "updates the requested profile" do
        profile = Profile.create! valid_profile_attributes
        put user_profile_path(id: profile.to_param, profile: new_attributes, user_id: user.id)
        profile.reload
        expect(profile.first_name).to eql("Star")
      end

      it "assigns the requested profile as @profile" do
        profile = Profile.create! valid_profile_attributes
        put user_profile_path(id: profile.to_param, profile: new_attributes, user_id: user.id)
        expect(assigns(:profile)).to eq(profile)
      end

      it "redirects to the profile" do
        profile = Profile.create! valid_profile_attributes
        put user_profile_path(id: profile.to_param, profile: new_attributes, user_id: user.id)
        expect(response).to render_template(:show)
      end
    end

    describe "with invalid params" do
      it "assigns the profile as @profile" do
        profile = Profile.create! valid_profile_attributes
        put user_profile_path(id: profile.to_param, profile: invalid_profile_attributes, user_id: user.id)
        expect(assigns(:profile)).to eq(profile)
      end

      it "re-renders the 'edit' template" do
        profile = Profile.create! valid_profile_attributes
        put user_profile_path(id: profile.to_param, profile: invalid_profile_attributes, user_id: user.id)
        expect(response).to render_template("edit")
      end
    end
  end

  describe "DELETE destroy" do
    before do
      sign_in user
    end

    it "destroys the requested profile" do
      profile = Profile.create! valid_profile_attributes
      delete user_profile_path(id: profile.to_param, user_id: user.id)
      expect(response).to redirect_to(root_path)
    end

    it "redirects to the profiles list" do
      profile = Profile.create! valid_profile_attributes

      expect {
        delete user_profile_path(id: profile.to_param, user_id: user.id)
      }.to change(Profile, :count).by(-1)
    end
  end
end
