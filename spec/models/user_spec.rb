require "rails_helper"

RSpec.describe User do
  it { is_expected.to validate_presence_of :email }

  it { is_expected.to have_many :reviews }

  it { is_expected.to have_many :messages }

  context "validation test" do
    it "ensure full name presence and truthly password" do
      user = described_class.create(full_name: "John", password: "123456")
      expect(user).to be_invalid
    end

    it "will successfully save" do
      user = described_class.create(email: "tok@ya.ru", password: "123456")
      expect(user).to be_valid
    end

    it "ensure name presence and wrong password" do
      user = described_class.create(full_name: "John", password: "12345")
      expect(user).to be_invalid
    end

    it "ensure email presence and wrong password" do
      user = described_class.create(email: "tok@ya.ru", password: "12345")
      expect(user).to be_invalid
    end

    it "ensure admin role" do
      user = described_class.create(email: "tok@ya.ru", password: "123456", role: :admin)
      expect(user.admin?).to be true
    end
  end
end
