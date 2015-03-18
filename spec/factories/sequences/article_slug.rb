FactoryGirl.define do

  sequence :article_slug do |n|
    "article-#{n}"
  end

end
