require 'rails_helper'

RSpec.describe List, type: :model do
  context 'associations' do
    it { should belong_to(:board) }
    it { should have_many(:tasks) }
  end

  context 'validations' do
    it { should validate_presence_of(:name) }
  end
end
