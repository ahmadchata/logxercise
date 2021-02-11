require 'rails_helper'

RSpec.describe GroupExercise, type: :model do
  it { should belong_to(:group) }
  it { should belong_to(:exercise) }
end
