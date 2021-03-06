require 'rails_helper'

RSpec.describe Exercise, type: :model do
  let!(:user) { User.create!(name: 'Ahmad') }

  context 'Validates presence of name' do
    it 'should be valid' do
      @exercise = Exercise.create(name: 'Push ups', duration: 2, user_id: user.id)
      expect(@exercise.save).to be true
    end
    it 'should not be valid' do
      @exercise = Exercise.create(name: '', duration: 2, user_id: user.id)
      expect(@exercise.save).not_to be true
    end
  end

  context 'Validates length of name' do
    it 'name should not be too short' do
      @exercise = Exercise.create(name: 'Pu', duration: 2, user_id: user.id)
      expect(@exercise.save).not_to be true
    end
    it 'name should not be too long' do
      @exercise = Exercise.create(name: 'e' * 16, duration: 2, user_id: user.id)
      expect(@exercise.save).not_to be true
    end
  end

  context 'Association between exercise and group model' do
    it 'assign many groups to an exercise' do
      @exercise = Exercise.create!(name: 'Push ups', duration: 1, user_id: user.id)

      @group1 = Group.create!(name: 'Aerobic', user_id: user.id)
      @group2 = Group.create!(name: 'Cardial', user_id: user.id)

      @exercise.groups << @group1
      @exercise.groups << @group2

      expect(@exercise.groups.last.name).to eql('Cardial')
    end
  end
end
