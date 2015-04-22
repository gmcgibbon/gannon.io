require 'rails_helper'

RSpec.feature 'CreateArticles', type: :feature do

  before { visit '/' }

  context 'as admin' do

    let!(:user) { FactoryGirl.create(:user, :admin) }

    before { login_as(user) }

    scenario 'create article form' do

      click_link('New Article')

      within(:css, '#document') do
        expect(page.title).to have_content 'New Article'
      end

    end

    scenario 'create valid article' do

      create_article(
        title:   'Test Article!',
        content: 'This is test content!',
        slug:    'test-article'
      )

      expect(page.status_code).to eq 200
      expect(page).to have_content 'Article was successfully created!'
    end

    scenario 'create invalid article' do

      create_article(
        title:   'Test Article!',
        content: '',
        slug:    'test!article'
      )

      expect(page.status_code).to eq 422
      expect(page).to have_content 'Article could not be created!'
      expect(page).to have_content 'can\'t be blank'
      expect(page).to have_content 'must consist of lowercase and hyphens only'
    end

  end

end
