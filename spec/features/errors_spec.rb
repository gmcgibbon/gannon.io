require 'rails_helper'

RSpec.feature 'Errors', type: :feature do

  describe '404 not found' do
    before { visit '/invalid/route/test' }

    it 'should get status code 404' do
      expect(page.status_code).to eq 404
    end
    it 'should see not found' do
      expect(page).to have_content('Not Found')
    end
  end

  # TODO Add tests for 422 and 500 when used

end
