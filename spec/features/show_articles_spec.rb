require 'rails_helper'

RSpec.feature 'ShowArticles', type: :feature do

  let!(:article) { FactoryGirl.create(:article, :with_user) }

  before { visit '/' }

  context 'as guest' do

    let(:stripped_content) { strip_paras(article.content)[0..147] << '...' }

    scenario 'show' do

      click_link(article.title)

      expect(page.current_url).to have_content(article.slug)
      expect(page.title).to have_content(article.title)
      expect(page).to have_content(article.title)
      expect(page).to have_content(strip_paras(article.content))
      expect(page).to have_content(article.created_at.strftime('%B %d, %Y at %I:%M%p'))
      expect(page).to have_content(article.updated_at.strftime('%B %d, %Y at %I:%M%p'))
      expect(page).to have_content(article.user.name)
    end

  end

end
