require 'rails_helper'

RSpec.describe User, type: :model do
  context 'Validates presence of name' do
    it 'should be valid' do
      @user = User.new(name: "Ahmad")
      expect(@user.save).to be true
    end
    it 'should not be blank' do
      @user = User.new(name: "")
      expect(@user.save).not_to be true
    end
  end

  context 'Validates length of name' do
    it 'should be valid' do
      @user = User.new(name: "Ahmad")
      expect(@user.save).to be true
    end
    it 'should not be too short' do
      @user = User.new(name: "Ah")
      expect(@user.save).not_to be true
    end
    it 'should not be too long' do
      @user = User.new(name: "A" * 16)
      expect(@user.save).not_to be true
    end
  end

  context 'Validates uniqueness of name' do
    it 'should be invalid' do
      @user = User.create(name: "Ahmad")
      @duplicate_user = @user.dup
      expect(@duplicate_user.save).not_to be true
    end
  end

  context 'Association between user and group model' do
    it 'creates many groups' do
      @user = User.create(name: "Ahmad")
      @user.groups.create(name: "Aerobic")
      @user.groups.create(name: "Cardial")
      expect(Group.last.user.name).to eql(@user.name)
    end
  end

  context 'Association between user and exercise model' do
    it 'creates many exercises' do
      @user = User.create(name: "Ahmad")
      @user.exercises.create(name: "Push Ups", duration: 1)
      @user.exercises.create(name: "Plank", duration: 2)
      expect(Exercise.last.user.name).to eql(@user.name)
    end
  end

end
