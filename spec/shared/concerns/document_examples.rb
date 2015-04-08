shared_examples 'document' do

  include MarkdownHelper

  subject { FactoryGirl.build described_class }

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

  describe '#content_as_html' do

    let(:markdown) { '# _Hello_ `Markdown`' }
    let(:html) { markdown_to_html(markdown) }

    before { subject.content = markdown }

    it 'should change content to markdown content as html' do
      expect(subject.content_as_html).to eq html
    end
  end

  describe '#to_param' do

    let(:slug) { subject.slug }

    it 'should equal slug' do
      expect(subject.to_param).to eq slug
    end
  end

end
