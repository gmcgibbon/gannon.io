require 'rails_helper'

RSpec.feature 'MarkdownArticles', type: :feature do

  before { visit '/' }

  context 'as admin' do

    let!(:user) { FactoryGirl.create(:user, :admin) }

    before { login_as(user) }

    scenario 'create valid markdown article' do

      create_article(
        title:   'Test Article!',
        content: '###This is test `content`!',
        slug:    'test-article'
      )

      expect(page.status_code).to eq 200
      expect(page).to have_content 'This is test content!'
    end

  end

end
