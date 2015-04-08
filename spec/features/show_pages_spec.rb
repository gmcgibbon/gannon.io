require 'rails_helper'

RSpec.feature 'ShowPages', type: :feature do

  let!(:page_obj) { FactoryGirl.create(:page) }

  before { visit '/' }

  context 'as guest' do

    scenario 'show' do

      click_link(page_obj.title)

      expect(page.current_url).to have_content(page_obj.slug)
      expect(page.title).to have_content(page_obj.title)
      expect(page).to have_content(page_obj.title)
      expect(page).to have_content(page_obj.content)
    end

  end

end
