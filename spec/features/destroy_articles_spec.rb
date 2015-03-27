require 'rails_helper'

RSpec.feature 'DestroyArticles', type: :feature, js: true do

  let!(:article) { FactoryGirl.create(:article, :with_user) }

  before { visit '/' }

  context 'as admin' do

    let!(:user) { FactoryGirl.create(:user, :admin) }

    before { login_as(user) }

    scenario 'article delete on show' do

      click_link(article.title)
      click_link('Delete')

      expect(page.status_code).to eq 200
      expect(page).to have_content 'Article was successfully deleted!'
      expect(page.current_url).to_not have_content article.slug
    end

    scenario 'article delete on edit' do

      click_link(article.title)
      click_link('Edit')

      click_button('Delete Article')

      expect(page.status_code).to eq 200
      expect(page).to have_content 'Article was successfully deleted!'
      expect(page.current_url).to_not have_content article.slug
    end

  end

end
