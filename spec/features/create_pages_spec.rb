require 'rails_helper'

RSpec.feature 'CreatePages', type: :feature do

  before { visit '/' }

  context 'as admin' do

    let!(:user) { FactoryGirl.create(:user, :admin) }

    scenario 'make' do

      login_as(user)

      click_link('New Page')

      fill_in('Title', with: 'Test Page!')
      fill_in('Content', with: 'This is test content!')
      fill_in('Slug', with: 'test-page')

      click_button('Create')
    end

  end

end
