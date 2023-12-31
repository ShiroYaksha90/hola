require 'rails_helper'

RSpec.describe User, type: :model do
  before(:each) do
    @user = User.new(name: 'Example User', email: 'example123@example.com', password: 'foobar',
                     password_confirmation: 'foobar')
  end
  describe 'validations' do
    it 'is valid with valid attributes' do
      expect(@user).to be_valid
    end
    it 'is not valid without a name' do
      @user.name = nil
      expect(@user).to_not be_valid
    end
    it 'is not valid without an email' do
      @user.email = nil
      expect(@user).to_not be_valid
    end
    it 'is not valid with a name longer than 50 characters' do
      @user.name = 'a' * 51
      expect(@user).to_not be_valid
    end
    it 'is not valid with email longer than 255 characters' do
      @user.email = "#{'a' * 244}@example.com"
      expect(@user).to_not be_valid
    end
    it 'is valid with valid email addresses' do
      valid_addresses = %w[user@example.com User@foo.COM A_US-ER@foo.bar.org first.last@foo.jp alice+bob@baz.cn]
      valid_addresses.each do |valid_address|
        @user.email = valid_address
        expect(@user).to be_valid, "#{valid_address.inspect} should be valid"
      end
    end
    it 'is not valid with invalid email addresses' do
      invalid_addresses = %w[user@example,com user_at_foo.org
                             user.name@example.
                             foo@bar_baz.com foo@bar+baz.com]
      invalid_addresses.each do |invalid_address|
        @user.email = invalid_address
        expect(@user).to_not be_valid, "#{invalid_address.inspect} should be invalid"
      end
    end
    it 'is not valid with a duplicate email address' do
      duplicate_user = @user.dup
      @user.save
      expect(duplicate_user).to_not be_valid
    end
    it 'email addresses should be saved as lower-case' do
      mixed_case_email = 'Foo@ExAMPLe.CoM'
      @user.email = mixed_case_email
      @user.save
      expect(@user.reload.email).to eq(mixed_case_email.downcase)
    end
    it 'is not valid without a password' do
      @user.password = @user.password_confirmation = '' * 6
      expect(@user).to_not be_valid
    end
    it 'is not valid with a password shorter than 6 characters' do
      @user.password = @user.password_confirmation = 'a' * 5
      expect(@user).to_not be_valid
    end
  end
end
