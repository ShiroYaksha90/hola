require 'rails_helper'

RSpec.describe 'UsersLogins', type: :request do
  fixtures :users
  describe 'GET /users_logins' do
    it 'login with valid email/invalid password' do
      @user = users(:basim)
      get login_path
      render_template 'sessions/new'
      post login_path, params: { session: { email: @user.email, password: 'invalid' } }
      expect(is_logged_in?).to be_falsey
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
      expect(is_logged_in?).to be_truthy
      expect(response).to redirect_to(@user)
      follow_redirect!
      expect(response).to render_template('users/show')
      expect(response.body).to_not include('Login')
      expect(response.body).to include('Log out')
      expect(response.body).to include('Profile')
      delete logout_path
      expect(is_logged_in?).to be_falsey
      expect(response).to have_http_status(:see_other)
      redirect_to root_url
      follow_redirect!
      expect(response.body).to include('Log in')
      expect(response.body).to_not include('Log out')
      expect(response.body).to_not include('Profile')
    end
  end
end
