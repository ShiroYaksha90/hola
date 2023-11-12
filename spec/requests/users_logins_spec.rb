require 'rails_helper'

RSpec.describe 'UsersLogins', type: :request do
  fixtures :users
  describe 'GET /users_logins' do
    it 'works! (now write some real specs)' do
      get login_path
      render_template 'sessions/new'
      post login_path, params: { session: { email: '', password: '' } }
      expect(response).to be_unprocessable
      render_template 'sessions/new'
      expect(flash.empty?).to be_falsey
      get root_path
      expect(flash.empty?).to be_truthy
    end
  end

  describe 'login with valid information' do
    it 'login with valid information' do
      @user = users(:basim)
      get login_path
      post login_path, params: { session: { email: @user.email, password: 'password' } }
      expect(response).to redirect_to(@user)
      follow_redirect!
      expect(response).to render_template('users/show')
      expect(response.body).to_not include('Login')
      expect(response.body).to include('Logout')
      expect(response.body).to include('Profile')
    end
  end
end
