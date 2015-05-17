require 'rails_helper'

RSpec.describe Board, type: :model do
  context "associations" do
    it { should have_many(:user_boards) }
    it { should have_many(:tasks) }
  end

  context "validations" do
    it { should validate_presence_of(:name) }
  end
end
