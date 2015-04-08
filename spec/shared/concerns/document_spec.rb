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

  describe '#content_markdown' do

    let(:html) { subject.content }
    let(:markdown) { html_to_markdown(html) }

    it 'should equal content as markdown' do
      expect(subject.content_markdown).to eq markdown
    end
  end

  describe '#content_markdown=' do

    let(:markdown) { '# _Hello_ `Markdown`' }
    let(:html) { markdown_to_html(markdown) }

    before { subject.content_markdown = markdown }

    it 'should change content to markdown content as html' do
      expect(subject.content).to eq html
    end
  end

  describe '#to_param' do

    let(:slug) { subject.slug }

    it 'should equal slug' do
      expect(subject.to_param).to eq slug
    end
  end

end
