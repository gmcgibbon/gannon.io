FactoryGirl.define do

  factory :article do

    title { Faker::Lorem.words(rand(1..8)).map(&:capitalize).join(' ') }
    slug  { generate :article_slug }
    content do
      paras = Faker::Lorem::paragraphs rand(3..15)

      '<p>' + paras.join('</p><p>') + '</p>'
    end

    trait :with_category do
      category
    end

    trait :with_user do
      user
    end

  end
end
