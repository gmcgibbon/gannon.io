FactoryGirl.define do

  factory :page do

    title { Faker::Lorem.words(rand(1..3)).map(&:capitalize).join(' ') }
    slug  { generate :page_slug }
    content do
      Faker::Lorem::paragraphs(rand(3..20)).join '\n'
    end

  end
end
