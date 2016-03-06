require 'rails_helper'

RSpec.describe User, type: :model do
  context 'associations' do
    it { should have_many(:user_boards) }
    it { should have_many(:boards) }
  end

  context '#full_name' do
    let(:user) { FactoryGirl.create(:user, first_name: 'Victor', last_name: 'Shmigol') }

    it { expect(user.full_name).to eq 'Victor Shmigol' }
  end
end
