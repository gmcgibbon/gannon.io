require 'rails_helper'

RSpec.describe MarkdownHelper, type: :helper do

  describe '#html_to_markdown' do

    let(:data) { '<h2>This <code>is</code> <em>a</em> <strong>test</strong></h2>' }

    subject { html_to_markdown(data).chomp }

    it { should eq '## This `is` _a_ **test**' }

  end

  describe '#markdown_to_html' do

    let(:data) { '## This `is` _a_ **test**' }

    subject { markdown_to_html(data).chomp }

    it { should eq '<h2>This <code>is</code> <em>a</em> <strong>test</strong></h2>' }

  end

end
