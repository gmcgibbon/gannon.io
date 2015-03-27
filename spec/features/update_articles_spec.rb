require 'rails_helper'

RSpec.feature 'UpdateArticles', type: :feature do

  let!(:article) { FactoryGirl.create(:article, :with_user) }

  before { visit '/' }

  context 'as admin' do

    let!(:user) { FactoryGirl.create(:user, :admin) }

    before { login_as(user) }

    scenario 'valid article update' do

      click_link(article.title)
      click_link('Edit')
      expect(page.title).to have_content 'Edit Article'

      fill_in('Title', with: 'Edited Article!')
      fill_in('Content', with: 'This is updated test content!')
      fill_in('Slug', with: 'updated-test-article')

      click_button('Update Article')

      expect(page.status_code).to eq 200
      expect(page).to have_content 'Article was successfully updated!'
      expect(page.current_url).to have_content 'updated-test-article'
    end

    scenario 'invalid article update' do

      click_link(article.title)
      click_link('Edit')
      expect(page.title).to have_content 'Edit Article'

      fill_in('Title', with: 'Edited Article!')
      fill_in('Content', with: '')
      fill_in('Slug', with: 'updated!test!article')

      click_button('Update Article')

      expect(page.status_code).to eq 422
      expect(page).to have_content 'Article could not be updated!'
      expect(page).to have_content 'can\'t be blank'
      expect(page).to have_content 'must consist of lowercase and hyphens only'
      expect(find_field('Slug').value).to eq article.slug
    end

  end

end
