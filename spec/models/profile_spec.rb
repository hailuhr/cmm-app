RSpec.describe Profile, type: :model do
  describe "database columns" do
    it { is_expected.to have_db_column(:first_name) }
    it { is_expected.to have_db_column(:last_name) }
    it { is_expected.to have_db_column(:bio) }
  end

  describe "associations" do
    it { should belong_to :user }
  end

  describe "validations" do
    let(:profile) { Profile.new() }
    it "should have a first name" do
      profile.first_name = nil
      expect(profile).to_not be_valid
    end
  end

  describe "#full_name" do
    context "name is Hai Loo" do
      subject { Profile.new(first_name: "Hai", last_name: "Loo").full_name }
      it { is_expected.to eq("Hai Loo") }
    end

    context "only first is populated with Lisa" do
      subject { Profile.new(first_name: "Lisa", last_name: nil).full_name }
      it { is_expected.to eq("Lisa") }
    end

    context "only last is populated with Harris" do
      subject { Profile.new(first_name: nil, last_name: "Harris").full_name }
      it { is_expected.to eq("Harris") }
    end

    context "name is nil" do
      subject { Profile.new(first_name: nil, last_name: nil).full_name }
      it { is_expected.to eq("") }
    end
  end
end
