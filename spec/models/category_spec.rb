require 'rails_helper'

describe Category, type: :model do

  subject { FactoryGirl.build :category }

  it_should_behave_like 'slug_findable'

  context 'associations' do
    it { should have_and_belong_to_many :articles }
  end

  describe '#to_builder_json' do

    context 'valid attributes' do

      let(:json) do
        Jbuilder.new do |json|
          json.title subject.title
          json.slug  subject.slug
        end
        .target!
      end

      before do
        subject.title = 'This is a test title'
        subject.slug  = 'this-is-a-test-slug'
      end

      it 'should match valid builder json' do
        expect(subject.to_builder_json).to eq json
      end
    end

    context 'invalid attributes' do

      let(:json) do
        Jbuilder.new do |json|
          json.error subject.errors.full_messages.to_sentence
        end
        .target!
      end

      before do
        subject.title = ''
        subject.slug  = '!invalid-test-slug'
      end

      it 'should match invalid builder json' do
        expect(subject.to_builder_json).to eq json
      end
    end
  end
end
