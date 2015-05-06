require 'rails_helper'

RSpec.feature 'UpdateCategories', type: :feature, js: true do

  let!(:categories) { FactoryGirl.create_list(:category, 5) }
  let!(:article) { FactoryGirl.create(:article, :with_user, with_categories: [categories.first]) }
  let(:category) { categories.first }

  before { visit '/' }

  context 'as admin' do

    let!(:user) { FactoryGirl.create(:user, :admin) }

    before { login_as(user) }

    context 'update category with valid data' do

      scenario 'from root' do

        click_root_link

        within(:css, ".category[data-slug=\"#{category.slug}\"]") do
          click_link('Edit')

          # TODO: Update category and assert change

          # fill_in('Title', with: 'Updated Category')
          # fill_in('Slug', with: 'updated-slug-x')
          # click_button('Update Category')

          # wait_for_ajax()

          # expect(page).to have_content 'Updated Category'
        end
      end

    end

    context 'update category with invalid data' do

      scenario 'from root' do

        click_root_link

        within(:css, ".category[data-slug=\"#{category.slug}\"]") do
          click_link('Edit')

          # TODO: Fill in category data and assert change

          # fill_in('Title', with: 'Updated Category')
          # fill_in('Slug', with: 'c@tegory-Slug')
          # click_button('Update Category')

          wait_for_ajax()

          # expect(page).to_not have_content 'Updated Category'
        end
      end

    end

  end

end
