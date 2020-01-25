RSpec.describe User, type: :model do
  describe "database columns" do
    it { is_expected.to have_db_column(:email) }
  end

  describe "associations" do
    it { should have_one :profile }
  end

  describe "validations" do
    let(:user) { User.new() }
    it "should have an email" do
      user.email = nil
      expect(user).to_not be_valid
    end
  end
end
