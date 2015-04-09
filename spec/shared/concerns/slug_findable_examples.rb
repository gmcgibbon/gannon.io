shared_examples 'slug_findable' do

  subject { FactoryGirl.build described_class }

  context 'validations' do
    it { should validate_presence_of :slug }

    it { should validate_uniqueness_of :slug }

    it { should allow_value('is-valid-slug').for(:slug) }
    it { should allow_value('33-valid-slug').for(:slug) }
    it { should_not allow_value('Invalid-slug').for(:slug) }
    it { should_not allow_value('!nvalid/slug').for(:slug) }
  end

  describe '#to_param' do

    let(:slug) { subject.slug }

    it 'should equal slug' do
      expect(subject.to_param).to eq slug
    end
  end

end
