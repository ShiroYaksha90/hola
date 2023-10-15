require 'rails_helper'

RSpec.describe 'StaticPages', type: :request do
  describe 'GET /static_pages/home' do
    it 'should render a successfull response' do
      get static_pages_home_path
      expect(response).to have_http_status(200)
    end

    it "should have the content 'Welcome to our website!'" do
      get static_pages_home_path
      expect(response.body).to include('Welcome to our website!')
    end
  end

  describe 'GET /static_pages/help' do
    it 'should render a successfull response' do
      get static_pages_help_path
      expect(response).to have_http_status(200)
    end

    it "should have the content 'Help'" do
      get static_pages_help_path
      expect(response.body).to include('Welcome to the help page')
    end
  end

  describe 'GET /static_pages/about' do
    it 'should render a successfull response' do
      get static_pages_about_path
      expect(response).to have_http_status(200)
    end

    it "should have the content 'Help'" do
      get static_pages_about_path
      expect(response.body).to include('About Us')
    end
  end
end
