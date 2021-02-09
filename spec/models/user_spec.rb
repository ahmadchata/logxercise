require 'rails_helper'

RSpec.describe User, type: :model do
  context 'Validates presence of name' do
    it 'should be valid' do
      @user = User.new(name: "Ahmad")
      expect(@user.save).to be true
    end
    it 'should not be valid' do
      @user = User.new(name: "")
      expect(@user.save).not_to be true
    end
  end

  context 'Validates length of name' do
    it 'should be valid' do
      @user = User.new(name: "Ahmad")
      expect(@user.save).to be true
    end
    it 'should not be valid' do
      @user = User.new(name: "Ah")
      expect(@user.save).not_to be true
    end
  end

end
