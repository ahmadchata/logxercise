require 'rails_helper'

RSpec.describe 'New Group', type: :feature do
  before :each do
    @user = User.create!(name: "Ahmad")
  end
  it 'creates a new group' do
    visit '/login'
    fill_in 'Name', with: @user.name
    click_button 'Log in'
    expect(current_path).to eql("/users/2")

    click_link 'All groups'
    click_link 'Create new group'

    fill_in 'Name', with: "Cardial"

    click_button 'Create Group'
    expect(page).to have_content("Cardial")
  end
end
