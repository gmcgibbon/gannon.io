require 'rails_helper'

describe Category, type: :model do

  subject { FactoryGirl.build :category }

  it_should_behave_like 'slug_findable'

  context 'associations' do
    it { should have_and_belong_to_many :articles }
  end
end
