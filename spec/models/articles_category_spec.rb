require 'rails_helper'

describe ArticlesCategory, type: :model do

  subject { ArticlesCategory.new }

  context 'associations' do
    it { should belong_to :article }
    it { should belong_to :category }
    it { should validate_uniqueness_of(:article_id).scoped_to(:category_id) }
  end
end
