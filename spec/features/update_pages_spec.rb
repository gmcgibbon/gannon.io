require 'rails_helper'

RSpec.feature 'UpdatePages', type: :feature do

  let!(:page_obj) { FactoryGirl.create(:page) }

  before { visit '/' }

  context 'as admin' do

    let!(:user) { FactoryGirl.create(:user, :admin) }

    before { login_as(user) }

    scenario 'valid page update' do

      click_link(page_obj.title)

      click_link('Edit')

      fill_in('Title', with: 'Edited Page!')
      fill_in('Content', with: 'This is updated test content!')
      fill_in('Slug', with: 'updated-test-page')

      click_button('Update Page')

      expect(page.status_code).to eq 200
      expect(page).to have_content 'Page was successfully updated!'
      expect(page.current_url).to have_content page_obj.slug
    end

    scenario 'invalid page update' do

      click_link(page_obj.title)

      click_link('Edit')

      fill_in('Title', with: 'Edited Page!')
      fill_in('Content', with: '')
      fill_in('Slug', with: 'updated!test!page')

      click_button('Update Page')

      expect(page.status_code).to eq 422
      expect(page).to have_content 'Page could not be updated!'
      expect(page).to have_content 'can\'t be blank'
      expect(page).to have_content 'must consist of lowercase and hyphens only'
      expect(find_field('Slug').value).to eq page_obj.slug
    end

  end

end
