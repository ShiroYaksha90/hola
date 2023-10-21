require 'rails_helper'

RSpec.describe User, type: :model do
  before(:each) do
    @user = User.new(name: "Example User", email: "example123@example.com")
  end
  describe "validations" do
    it "is valid with valid attributes" do
      expect(@user).to be_valid
    end
    it "is not valid without a name" do
      @user.name = nil
      expect(@user).to_not be_valid
    end
    it "is not valid without an email" do
      @user.email = nil
      expect(@user).to_not be_valid
    end
    it "is not valid with a name longer than 50 characters" do
      @user.name = "a" * 51
      expect(@user).to_not be_valid
    end
    it "is not valid with email longer than 255 characters" do
      @user.email = 'a' * 244 + '@example.com'
      expect(@user).to_not be_valid
    end
  end
end
