FactoryGirl.define do
  factory :user_board do
    after(:create) do |user_board|
      user_board.user = FactoryGirl.create(:user)
    end

    after(:create) do |user_board|
      user_board.board = FactoryGirl.create(:board)
    end
  end
end
