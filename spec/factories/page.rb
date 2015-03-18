FactoryGirl.define do

  factory :page do

    title { Faker::Lorem.words(rand(1..3)).map(&:capitalize).join(' ') }
    slug  { generate :page_slug }
    content do
      paras = Faker::Lorem::paragraphs rand(3..25)

      '<p>' + paras.join('</p><p>') + '</p>'
    end

  end
end
