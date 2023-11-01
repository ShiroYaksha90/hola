require 'rails_helper'

RSpec.describe "UsersSignups", type: :request do
  describe "GET /users_signups" do
    it "unsuccessful signups" do
      get signup_path
      expect{
        post users_path, params: { user: { name: "",
                                           email: "user@invalid",
                                           password: "foo",
                                           password_confirmation: "bar" } }
      }.to_not change(User, :count)
      expect(response).to be_unprocessable
      expect(response).to render_template('users/new')
      expect(response.body).to include('The form contains 4 errors.')
      expect(response.body).to include('Name can&#39;t be blank')
      expect(response.body).to include('Email is invalid')
      expect(response.body).to include('Password confirmation doesn&#39;t match Password')
      expect(response.body).to include('Password is too short (minimum is 6 characters)')
      expect(response.body).to include('div class="field_with_errors"')
    end
  end
end
