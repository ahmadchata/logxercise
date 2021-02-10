require 'rails_helper'

RSpec.describe 'Log in', type: :feature do
  before :each do
    @user = User.create!(name: "Ahmad")
  end

  it 'logs in a new user' do
    visit '/login'
    fill_in 'Name', with: "Ahmad"
    click_button 'Log in'
    expect(page).to have_content("All my exercises")
  end
end
