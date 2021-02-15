require 'rails_helper'

RSpec.describe 'View ungrouped exercise', type: :feature do
  before :each do
    @user = User.create!(name: 'Ahmad')
  end
  it 'visits the ungrouped exercises' do
    visit '/login'
    fill_in 'Name', with: 'Ahmad'
    click_button 'Log in'
    click_link 'All my external exercises'
    expect(page).to have_content('External Exercises')
  end
end
