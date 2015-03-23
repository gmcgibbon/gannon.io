require 'rails_helper'

RSpec.feature 'Errors', type: :feature do

  scenario '404 not found' do

    visit '/invalid/route/test'

    expect(page.status_code).to eq 404
    expect(page).to have_content('Not found!')
  end

  # TODO Add tests for 500?

end
