require 'rails_helper'

describe Article, type: :model do

  subject { FactoryGirl.build :article }

  context 'validations' do
    it { should validate_presence_of :slug }
    it { should validate_presence_of :title }
    it { should validate_presence_of :content }

    it { should validate_uniqueness_of :slug }

    it { should allow_value('is-valid-slug').for(:slug) }
    it { should allow_value('33-valid-slug').for(:slug) }
    it { should_not allow_value('Invalid-slug').for(:slug) }
    it { should_not allow_value('!nvalid/slug').for(:slug) }
  end

  context 'associations' do
    it { should have_and_belong_to_many :categories }
  end
end
