require 'rails_helper'

RSpec.describe 'UsersSignups', type: :request do
  describe 'GET /users_signups' do
    it 'unsuccessful signups' do
      get signup_path
      expect do
        post users_path, params: { user: { name: '',
                                           email: 'user@invalid',
                                           password: 'foo',
                                           password_confirmation: 'bar' } }
      end.to_not change(User, :count)
      expect(response).to be_unprocessable
      expect(response).to render_template('users/new')
      expect(response.body).to include('The form contains 4 errors.')
      expect(response.body).to include('Name can&#39;t be blank')
      expect(response.body).to include('Email is invalid')
      expect(response.body).to include('Password confirmation doesn&#39;t match Password')
      expect(response.body).to include('Password is too short (minimum is 6 characters)')
      expect(response.body).to include('div class="field_with_errors"')
    end
    it 'Successfull signups' do
      get signup_path
      expect do
        post users_path, params: { user: { name: 'Exampl user',
                                           email: 'user@example.com',
                                           password: 'password',
                                           password_confirmation: 'password' } }
      end.to change(User, :count)
      expect(response).to be_redirect
      expect(response).to redirect_to(user_path(User.last))
      expect(response).to have_http_status(:found)
      follow_redirect!
      expect(response.body).to include('Welcome to the Hola!')
      expect(response.body).to include('Exampl user')
    end
    it 'valid signup information' do
      get signup_path
      expect do
        post users_path, params: { user: { name: 'Example User',
                                           email: 'user@example.com',
                                           password: 'password',
                                           password_confirmation: 'password' } }
      end.to change(User, :count).from(0).to(1)
      expect(response).to be_redirect
      follow_redirect!
      expect(response).to render_template(:show)
      expect(flash.empty?).to be_falsey
    end
  end
end
