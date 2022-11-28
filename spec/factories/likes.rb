FactoryBot.define do
  factory :likes do
    association :post_id
    association :user_id   
  end
end
