require 'rails_helper'

RSpec.describe BoardsController, type: :controller do
  let(:user) { FactoryGirl.create(:user) }
  let!(:user_board) { FactoryGirl.create(:user_board) }
  let!(:board) { FactoryGirl.create(:board) }
  let(:board_attributes) { FactoryGirl.attributes_for(:board) }
  let(:unvalid_board_attributes) { FactoryGirl.attributes_for(:board, name: '') }

  before do
    allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(user)
  end

  describe '#index' do
    it 'returns a successful 200 response' do
      get :index
      expect(response).to be_success
    end
  end

  describe '#create' do
    it 'add board' do
      expect do
        post :create, board: board_attributes
      end.to change(Board, :count).by(1)
    end

    it 'add board from unvalid board attributes' do
      expect do
        post :create, board: unvalid_board_attributes
      end.to_not change(Board, :count)
    end
  end

  describe '#destroy' do
    it { expect { delete :destroy, id: board.id }.to change(Board, :count).by(-1) }
  end
end
