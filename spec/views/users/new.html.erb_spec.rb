require 'rails_helper'

RSpec.describe 'user/new.html.erb', type: :feature do
  scenario 'should have the right title' do
    visit '/signup'
    expect(page).to have_content('Sign up')
    expect(page).to have_title('Sign up | Hola App')
    expect(page).to have_selector('h1', text: 'Sign up')
  end
end
