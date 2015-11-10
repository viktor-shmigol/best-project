require 'rails_helper'

RSpec.describe Board, type: :model do
  context "associations" do
    it { should have_many(:user_boards) }
    it { should have_many(:tasks) }
    it { should have_many(:lists) }
    it { should have_many(:members).class_name('User') }
  end

  context "validations" do
    it { should validate_presence_of(:name) }
  end
end
