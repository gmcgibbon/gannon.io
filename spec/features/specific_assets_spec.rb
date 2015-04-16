require 'rails_helper'

RSpec.feature 'SpecificAssets', type: :feature do

  context 'as guest' do

    context 'external controller' do

      before { visit new_user_session_path }

      scenario 'verify asset tags' do

        expect(page).to_not have_xpath("//link[contains(@href, 'sessions.css')]", visible: false)
        expect(page).to_not have_xpath("//script[contains(@src, 'sessions.js')]", visible: false)
      end

    end

    context 'internal controller' do

      before { visit root_path }

      scenario 'verify asset tags' do

        expect(page).to have_xpath("//link[contains(@href, 'articles.css')]", visible: false)
        expect(page).to have_xpath("//script[contains(@src, 'articles.js')]", visible: false)
      end

    end



  end

end
