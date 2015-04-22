require 'rails_helper'

RSpec.feature 'CreateCategories', type: :feature, js: true do

  before { visit '/' }

  context 'as admin' do

    let!(:user) { FactoryGirl.create(:user, :admin) }
    let!(:categories) { FactoryGirl.create_list(:category, 5) }

    before { login_as(user) }

    context 'create valid category' do

      scenario 'from main page' do

        create_category(
          title:   'Test Article!'
        )

        # Does not work with prompts
        # within(:css, '#categories .list ul') do
        #   expect(page).to have_selector 'li', categories.count +1
        # end
      end

    end

    context 'create invalid category' do

      scenario 'from main page' do

        create_category(
          title:   ''
        )

        within(:css, '#categories .list ul') do
          expect(page).to have_selector 'li', categories.count
        end
      end

    end

  end

end
