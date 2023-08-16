FactoryBot.define do
  factory :contact do
    subject { Faker::Lorem.sentence }
    message { Faker::Lorem.paragraph }
    association :user, factory: :user
  end
end