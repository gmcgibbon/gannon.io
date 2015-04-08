require 'rails_helper'

describe Article, type: :model do

  subject { FactoryGirl.build :article }

  it_should_behave_like 'document'

  context 'associations' do
    it { should have_and_belong_to_many :categories }
  end
end
