shared_examples 'slug_findable' do

  subject { FactoryGirl.build described_class }

  context 'validations' do
    it { should validate_uniqueness_of :slug }

    it { should callback(:ensure_slug).before(:validation) }

    it { should allow_value('is-valid-slug').for(:slug) }
    it { should allow_value('33-valid-slug').for(:slug) }
    it { should_not allow_value('Invalid-slug').for(:slug) }
    it { should_not allow_value('!nvalid/slug').for(:slug) }
  end

  describe '#ensure_slug' do

    context 'with slug' do

      let(:slug) { 'test-slug-explicit' }

      before do
        subject.slug = slug
        subject.ensure_slug
      end

      it 'should do nothing' do
        expect(subject.slug).to eq slug
      end
    end

    context 'without slug' do

      let(:slug) { subject.title.parameterize }

      before do
        subject.slug = nil
        subject.ensure_slug
      end

      it 'should assign parameterized title' do
        expect(subject.slug).to eq slug
      end
    end
  end

  describe '#to_param' do

    let(:slug) { subject.slug }

    it 'should equal slug' do
      expect(subject.to_param).to eq slug
    end
  end

end
