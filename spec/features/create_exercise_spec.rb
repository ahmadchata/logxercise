require 'rails_helper'

RSpec.describe 'New Exercise', type: :feature do
  before :each do
    @user = User.create!(name: 'Ahmad')
  end
  it 'creates a new exercise' do
    visit '/login'
    fill_in 'Name', with: @user.name
    click_button 'Log in'
    expect(current_path).to eql('/users/1')

    click_link 'All my exercises'
    click_link 'Create new exercise'

    fill_in 'Name', with: 'Jogging'
    fill_in 'Duration', with: 1

    click_button 'Create Exercise'
    expect(page).to have_content('Jogging')
  end
end
