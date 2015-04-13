shared_examples 'markdown_writable' do

  include MarkdownHelper

  subject { FactoryGirl.build described_class }

  context 'validations' do
    it { should validate_presence_of :content }
  end

  describe '#content_as_html' do

    let(:markdown) { '### _Hello_ `Markdown`' }
    let(:html) { markdown_to_html(markdown) }

    before { subject.content = markdown }

    it 'should equal content as html' do
      expect(subject.content_as_html).to eq html
    end
  end

  describe '#content_as_plain' do

    let(:markdown) { '# ~~Testing~~ *Markdown*' }
    let(:plain) { markdown_to_plain(markdown) }

    before { subject.content = markdown }

    it 'should equal content as plain text' do
      expect(subject.content_as_plain).to eq plain
    end
  end

end
