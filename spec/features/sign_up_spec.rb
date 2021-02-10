require 'rails_helper'

RSpec.describe 'Sign up', type: :feature do
  it 'registers a new user' do
    visit '/signup'
    fill_in 'Name', with: "Ahmad"
    click_button 'Create Account'
    expect(page).to have_content("Account settings")
  end
end
