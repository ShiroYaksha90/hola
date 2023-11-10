require 'rails_helper'

RSpec.describe 'UsersLogins', type: :request do
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
end
