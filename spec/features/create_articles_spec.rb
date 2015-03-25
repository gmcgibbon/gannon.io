require 'rails_helper'

RSpec.feature 'CreateArticles', type: :feature do

  before { visit '/' }

  context 'as admin' do

    let!(:user) { FactoryGirl.create(:user, :admin) }

    before { login_as(user) }

    scenario 'create valid article' do

      click_link('New Article')

      fill_in('Title', with: 'Test Article!')
      fill_in('Content', with: 'This is test content!')
      fill_in('Slug', with: 'test-article')

      click_button('Create Article')

      expect(page.status_code).to eq 200
      expect(page).to have_content 'Article was successfully created!'
    end

    scenario 'create invalid article' do

      click_link('New Article')

      fill_in('Title', with: 'Test Article!')
      fill_in('Content', with: '')
      fill_in('Slug', with: 'test!article')

      click_button('Create Article')

      expect(page.status_code).to eq 422
      expect(page).to have_content 'Article could not be created!'
      expect(page).to have_content 'can\'t be blank'
      expect(page).to have_content 'must consist of lowercase and hyphens only'
    end

  end

end
