require 'rails_helper'

RSpec.describe UserBoard, type: :model do
  context "associations" do
    it { should belong_to(:user) }
    it { should belong_to(:board) }
  end
end
