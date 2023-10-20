require 'rails_helper'

RSpec.describe 'StaticPages', type: :request do
  describe 'GET /static_pages/home' do
    it 'should render a successfull response' do
      get root_path
      expect(response).to have_http_status(200)
    end

    it "should have the content 'Welcome to our website!'" do
      get root_path
      expect(response.body).to include('Welcome to our website!')
    end

    it 'should have the right title' do
      get root_path
      expect(response.body).to include('<title>Hola App</title>')
    end
  end

  describe 'GET /static_pages/help' do
    it 'should render a successfull response' do
      get help_path
      expect(response).to have_http_status(200)
    end

    it "should have the content 'Help'" do
      get help_path
      expect(response.body).to include('Welcome to the help page')
    end

    it 'should have the right title' do
      get help_path
      expect(response.body).to include('<title>Help | Hola App</title>')
    end
  end

  describe 'GET /static_pages/about' do
    it 'should render a successfull response' do
      get about_path
      expect(response).to have_http_status(200)
    end

    it "should have the content 'About'" do
      get about_path
      expect(response.body).to include('About Us')
    end

    it 'should have the right title' do
      get about_path
      expect(response.body).to include('<title>About | Hola App</title>')
    end
  end

  describe 'GET /static_pages/contact' do
    it 'should render a successfull response' do
      get contact_path
      expect(response).to have_http_status(200)
    end

    it "should have the content 'Contact'" do
      get contact_path
      expect(response.body).to include('Contact Us')
    end

    it 'should have the right title' do
      get contact_path
      expect(response.body).to include('<title>Contact | Hola App</title>')
    end
  end
end
