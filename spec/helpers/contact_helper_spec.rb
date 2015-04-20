require 'rails_helper'

RSpec.describe ContactHelper, type: :helper do

  describe '#fa_contact_links' do

    let(:link_hash) do
      {
        envelope: 'mailto:gannon.mcgibbon@gmail.com',
        linkedin: 'https://www.linkedin.com/in/gannonmcgibbon',
        github:   'https://github.com/gmcgibbon',
      }
    end

    subject { fa_contact_links() }

    it { should be_a Hash }
    it { should eq link_hash }

  end

end
