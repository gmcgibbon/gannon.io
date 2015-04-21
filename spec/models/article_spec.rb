require 'rails_helper'

describe Article, type: :model do

  subject { FactoryGirl.build :article }

  it_should_behave_like 'markdown_writable'
  it_should_behave_like 'slug_findable'

  context 'associations' do
    it { should have_many(:categories).through :articles_categories }
    it { should have_many :articles_categories }
    it { should belong_to :user }
  end
end
