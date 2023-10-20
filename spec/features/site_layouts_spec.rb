require 'rails_helper'

RSpec.describe 'SiteLayouts', type: :feature do
  describe 'layout links' do
    it 'renders the correct page' do
      visit '/'
      expect(page).to have_content('Welcome to our website!')
      expect(page).to have_selector('h1', text: 'Welcome to our website!')
    end

    it 'it routes to the correct path' do
      visit '/'
      expect(page).to have_link('Home', href: '/')
      expect(page).to have_link('Help', href: '/help')
      expect(page).to have_link('About', href: '/about')
      expect(page).to have_link('Contact', href: '/contact')
    end
  end
end
