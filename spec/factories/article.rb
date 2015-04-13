FactoryGirl.define do

  factory :article do

    title { Faker::Lorem.words(rand(1..8)).map(&:capitalize).join(' ') }
    slug  { generate :article_slug }
    content do
      Faker::Lorem::paragraphs(rand(3..20)).join '\n'
    end

    transient do
      with_categories []
    end

    after(:create) do |article, evaluator|
      evaluator.with_categories.each do |category|
        article.categories << category
      end
    end

    trait :with_user do
      user
    end

  end
end
