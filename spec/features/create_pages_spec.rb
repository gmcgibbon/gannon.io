require 'rails_helper'

RSpec.feature 'CreatePages', type: :feature do

  before { visit '/' }

  context 'as admin' do

    let!(:user) { FactoryGirl.create(:user, :admin) }

    scenario 'make valid page' do

      login_as(user)

      click_link('New Page')

      fill_in('Title', with: 'Test Page!')
      fill_in('Content', with: 'This is test content!')
      fill_in('Slug', with: 'test-page')

      click_button('Create Page')

      expect(page.status_code).to eq 200
      expect(page).to have_content 'Page was successfully created!'

    end

    scenario 'make invalid page' do

      login_as(user)

      click_link('New Page')

      fill_in('Title', with: 'Test Page!')
      fill_in('Content', with: '')
      fill_in('Slug', with: 'test!page')

      click_button('Create Page')

      expect(page.status_code).to eq 422
      expect(page).to have_content 'Page could not be created!'
      expect(page).to have_content 'can\'t be blank'
      expect(page).to have_content 'must consist of lowercase and hyphens only'
    end

  end

end
