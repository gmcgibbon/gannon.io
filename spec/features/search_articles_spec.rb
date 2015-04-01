require 'rails_helper'

RSpec.feature 'SearchArticles', type: :feature do

  let!(:articles) { FactoryGirl.create_list :article, 10 }

  before { visit '/' }

  context 'as guest' do

    scenario 'search valid article title' do

      fill_in('#search', with: articles.first.title)

      click_button('Search')

      expect(page.status_code).to eq 200
      expect(page).to have_content ''
    end

    scenario 'search valid article content' do

      fill_in('#search', with: articles.first.content[0..20])

      click_button('Search')

      expect(page.status_code).to eq 200
      expect(page).to have_content ''
    end

    scenario 'search invalid article' do

      fill_in('#search', with: 'this content does not exist')

      click_button('Search')

      expect(page.status_code).to eq 200
      expect(page).to have_content ''
    end

  end

end
