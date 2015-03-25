require 'rails_helper'

RSpec.feature 'DestroyPages', type: :feature, js: true do

  let!(:page_obj) { FactoryGirl.create(:page) }

  before { visit '/' }

  context 'as admin' do

    let!(:user) { FactoryGirl.create(:user, :admin) }

    before { login_as(user) }

    scenario 'page delete on show' do

      click_link(page_obj.title)
      click_link('Delete')

      expect(page.status_code).to eq 200
      expect(page).to have_content 'Page was successfully deleted!'
      expect(page.current_url).to have_content page_obj.slug
    end

    scenario 'page delete on edit' do

      click_link(page_obj.title)
      click_link('Edit')

      click_button('Delete Page')

      expect(page.status_code).to eq 200
      expect(page).to have_content 'Page was successfully deleted!'
      expect(page.current_url).to have_content page_obj.slug
    end

  end

end
