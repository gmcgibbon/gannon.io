require 'rails_helper'

RSpec.feature 'ShowPages', type: :feature do

  let!(:page_obj) { FactoryGirl.create(:page) }

  before { visit '/' }

  context 'as guest' do

    scenario 'view' do

      click_link(page_obj.title)

      expect(page).to have_content(strip_paras(page_obj.content))
    end

  end

end
