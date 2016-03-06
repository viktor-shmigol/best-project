require 'rails_helper'

RSpec.describe Task, type: :model do
  context 'associations' do
    it { should belong_to(:list) }
    it { should belong_to(:board) }
  end

  context 'validations' do
    it { should validate_presence_of(:title) }
  end
end
