FactoryGirl.define do

  factory :category do

    name { Faker::Lorem.words rand(1..3) }
    slug  { generate :category_slug }

  end
end
