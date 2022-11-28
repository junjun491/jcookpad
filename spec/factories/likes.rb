FactoryBot.define do
  factory :likes do
    association :post
    association :user
  end
end
