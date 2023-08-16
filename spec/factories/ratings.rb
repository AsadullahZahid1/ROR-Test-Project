FactoryBot.define do
  factory :rating do
    rating{Faker::Number.between(from: 1, to: 5)}
    association :user, factory: :user
    association  :post, factory: :post
  end
end