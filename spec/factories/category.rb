FactoryGirl.define do

  factory :category do

    title { Faker::Lorem.words(rand(1..3)).map(&:capitalize).join(' ') }
    slug  { generate :category_slug }

    transient do
      with_articles []
    end

    after(:create) do |category, evaluator|
      evaluator.with_articles.each do |article|
        category.articles << article
      end
    end

  end
end
