require 'rails_helper'

RSpec.feature 'RootArticles', type: :feature, js: true do

  before do
    @articles = FactoryGirl.create_list(:article, 20, :with_user)
    visit '/'
  end

  context 'as guest' do

    let(:article_chunks) { @articles.reverse.in_groups_of 10 }

    scenario 'show all' do

      expect(page.title).to have_content 'Home'

      article_chunks.each do |chunk|

        chunk.each do |article|

          expect(page).to have_content(article.title)
          expect(page).to have_content(article.created_at.strftime('%B %d, %Y'))
        end

        scroll_to_bottom()
        wait_for_ajax()
      end
    end

  end

end
