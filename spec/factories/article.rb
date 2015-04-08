FactoryGirl.define do

  factory :article do

    title { Faker::Lorem.words(rand(1..8)).map(&:capitalize).join(' ') }
    slug  { generate :article_slug }
    content do
      Faker::Lorem::paragraphs(rand(3..20)).join '\n'
    end

    trait :with_category do
      category
    end

    trait :with_user do
      user
    end

  end
end
