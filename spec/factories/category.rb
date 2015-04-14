FactoryGirl.define do

  factory :category do

    title { Faker::Lorem.words(rand(1..3)).map(&:capitalize).join(' ') }
    slug  { generate :category_slug }

  end
end
