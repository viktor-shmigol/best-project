FactoryGirl.define do
  factory :list do
    name { Faker::Name.name }

    after(:create) do |list|
      list.group = FactoryGirl.create(:board)
    end
  end
end
