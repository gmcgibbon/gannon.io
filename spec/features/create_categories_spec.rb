require 'rails_helper'

RSpec.feature 'CreateCategories', type: :feature, js: true do

  let!(:categories) { FactoryGirl.create_list(:category, 5) }
  let!(:article) { FactoryGirl.create(:article, :with_user, with_categories: [categories.first]) }

  before { visit '/' }

  context 'as admin' do

    let!(:user) { FactoryGirl.create(:user, :admin) }

    before { login_as(user) }

    context 'create valid category' do

      scenario 'from root' do

        click_root_link

        create_category(
          title:   'Test Category 1!'
        )

        wait_for_ajax

        # TODO: Assert change
        # within(:css, '#categories .list ul') do
        #   expect(page).to have_selector 'li', categories.count +1
        # end
      end

      scenario 'from article edit' do

        click_link(article.title)
        click_link('Edit')

        create_category(
          title:   'Test Category 2!'
        )

        wait_for_ajax

        # TODO: Assert change
        # within(:css, '#categories .list ul') do
        #   expect(page).to have_selector 'li', categories.count +1
        # end
      end

    end

    context 'create invalid category' do

      scenario 'from root' do

        click_root_link

        create_category(
          title:   ''
        )

        wait_for_ajax

        within(:css, '#categories .list ul') do
          expect(page).to have_selector 'li', categories.count
        end
      end

      scenario 'from article edit' do

        click_link(article.title)
        click_link('Edit')

        create_category(
          title:   ''
        )

        wait_for_ajax

        within(:css, '#categories .list ul') do
          expect(page).to have_selector 'li', categories.count
        end
      end

    end

  end

end
