require 'rails_helper'

RSpec.feature 'DestroyCategories', type: :feature, js: true do

  let!(:category) { FactoryGirl.create(:category) }

  before { visit '/' }

  context 'as admin' do

    let!(:user) { FactoryGirl.create(:user, :admin) }

    before { login_as(user) }

    context 'destroy category with valid data' do

      scenario 'from root' do

        click_root_link

        within(:css, ".category[data-slug=\"#{category.slug}\"]") do
          click_link('Delete')

          wait_for_ajax()
        end

        expect(page).to_not have_content category.title
      end

    end

  end

end
