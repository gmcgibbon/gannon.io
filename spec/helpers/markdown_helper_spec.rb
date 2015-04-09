require 'rails_helper'

RSpec.describe MarkdownHelper, type: :helper do

  let(:markdown) { '## This `is` _a_ **test**. ~~123~~' }

  describe '#markdown_to_html' do

    let(:html) { "<h2>This <code>is</code> <em>a</em> <strong>test</strong>. <del>123</del></h2>\n" }

    subject { markdown_to_html(markdown) }

    it { should eq html }
    it { should be_a ActiveSupport::SafeBuffer }

  end

  describe '#markdown_to_plain' do

    let(:plain) { "This is a test. 123\n" }

    subject { markdown_to_plain(markdown) }

    it { should eq plain }
    it { should be_a ActiveSupport::SafeBuffer }

  end

end
