require 'rails_helper'

RSpec.feature 'Logins', type: :feature do

  describe 'user' do

    before { visit '/' }

    context 'as admin' do

      let!(:user) { FactoryGirl.create(:user, :admin) }

      scenario 'authenticate' do

        click_link('Log in')

        fill_in('Email', with: user.email)
        fill_in('Password', with: '11111111')

        click_button('Log in')

        expect(page).to have_content('Signed in successfully')
        expect(page).to have_content('Admin')
      end
    end

  end

end
