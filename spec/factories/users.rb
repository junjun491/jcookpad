FactoryBot.define do
  factory :user do
    sequence(:email, "test1@gmail.com")
    encrypted_password              {"12345678"}
    age {"30"}
    sex {"man"}
    password {"123123"}
    sequence(:name, "name1")
  end
end
