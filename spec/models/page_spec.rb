require 'rails_helper'

describe Page, type: :model do

  subject { FactoryGirl.build :page }

  it_should_behave_like 'document'

  context 'validations' do
    it { should_not allow_value('blog').for(:slug) }
    it { should_not allow_value('admin').for(:slug) }
    it { should_not allow_value('users').for(:slug) }
  end

  describe '#to_param' do

    it 'should equal slug' do
      expect(subject.to_param).to eq subject.slug
    end
  end
end
