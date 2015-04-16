require 'rails_helper'

RSpec.describe ViewHelper, type: :helper do

  describe '#external_controller?' do

    it 'should treat test controller as external' do
      expect(external_controller?).to be true
    end

  end

end
