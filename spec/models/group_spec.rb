require 'rails_helper'

RSpec.describe Group, type: :model do
  let!(:user) { User.create!(name: "Ahmad") }

  context 'Validates presence of name' do
    it 'should be valid' do
      @group = Group.create(name: "Aerobic", user_id: user.id)
      expect(@group.save).to be true
    end
    it 'should not be valid' do
      @group = Group.create(name: "", user_id: user.id)
      expect(@group.save).not_to be true
    end
  end

  context 'Validates uniqueness of group name' do
    it 'should be valid' do
      @group1 = Group.create(name: "Cardial", user_id: user.id)
      @group2 = Group.create(name: "Muscular", user_id: user.id)
      expect(@group2.save).to be true
    end
    it 'should not be valid' do
      @group1 = Group.create(name: "Cardial", user_id: user.id)
      @group2 = Group.create(name: "Cardial", user_id: user.id)
      expect(@group2.save).not_to be true
    end
  end

  context 'Validates length of group name' do
    it 'should be valid' do
      @group = Group.create(name: "Cardial", user_id: user.id)
    end
  end

end
