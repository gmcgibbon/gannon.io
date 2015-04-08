require 'rails_helper'

RSpec.feature 'SearchArticles', type: :feature, js: true do

  let!(:articles) { FactoryGirl.create_list :article, 10 }

  before { visit '/' }

  context 'as guest' do

    context 'with title' do

      before do
        articles.first.title = 'Unique article title!'
        articles.first.save
      end

      let(:term) { articles.first.title }

      scenario 'search' do

        search_for_article with: term

        expect(page.status_code).to eq 200
        expect(page.current_url).to have_content URI.escape term.gsub ' ', '+'
        expect(page).to have_content '1 Result for ' << "\"#{term}\""
      end

    end

    context 'with content' do

      before do
        articles.first.content = 'Unique article content!'
        articles.first.save
      end

      let(:term) { articles.first.content }

      scenario 'search' do

        search_for_article with: term

        expect(page.status_code).to eq 200
        expect(page.current_url).to have_content URI.escape term.gsub ' ', '+'
        expect(page).to have_content '1 Result for ' << "\"#{term}\""
      end

    end

    context 'with invalid data' do

      let(:term) { 'Invalid article title!' }

      scenario 'search' do

        search_for_article with: term

        expect(page.status_code).to eq 200
        expect(page.current_url).to have_content URI.escape term.gsub ' ', '+'
        expect(page).to have_content '0 Results for ' << "\"#{term}\""
      end

    end

    context 'with no data' do

      let(:term) { '' }

      scenario 'search' do

        search_for_article with: term

        expect(page.status_code).to eq 200
        expect(find_field('search')[:required]).to be_present
        expect(page).to_not have_content '0 Results for ' << "\"#{term}\""
      end

    end

  end

end
