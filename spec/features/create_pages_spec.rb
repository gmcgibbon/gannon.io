require 'rails_helper'

RSpec.feature 'CreatePages', type: :feature do

  before { visit '/' }

  context 'as admin' do

    let!(:user) { FactoryGirl.create(:user, :admin) }

    before { login_as(user) }

    scenario 'create page form' do

      click_link('New Page')

      within(:css, '#document') do
        expect(page.title).to have_content 'New Page'
      end

    end

    scenario 'create valid page' do

      create_page(
        title:   'Test Page!',
        content: 'This is test content!',
        slug:    'test-page'
      )

      expect(page.status_code).to eq 200
      expect(page).to have_content 'Page was successfully created!'
    end

    scenario 'create invalid page' do

      create_page(
        title:   'Test Page!',
        content: '',
        slug:    'test!page'
      )

      expect(page.status_code).to eq 422
      expect(page).to have_content 'Page could not be created!'
      expect(page).to have_content 'can\'t be blank'
      expect(page).to have_content 'must consist of lowercase and hyphens only'
    end

  end

end
