FactoryGirl.define do

  factory :user do

    name     { Faker::Name.name }
    email    { Faker::Internet.email }
    password { '1' * 8 }
    password_confirmation { '1' * 8 }

    trait :reader do # defaults to 0

      role { 0 }
    end

    trait :writer do

      role { 1 }
    end

    trait :admin do

      role { 2 }
    end
  end
end
