require 'rails_helper'

# Test public edit/new methods to verify strong params
# Ensure the :registerable devise attribute is enabled
RSpec.describe Devise::RegistrationsOverrideController, :type => :controller do

  # Initialize mapping for devise controllers
  before(:each) { @request.env["devise.mapping"] = Devise.mappings[:user] }

  context 'Authenticated' do

    let(:admin) { FactoryGirl.create :user, :admin }

    before(:each) { sign_in admin }

    # it { should permit(:name, :email, :password, :password_confirmation, :current_password).for(:update) }
  end

  context 'Unauthenticated' do

    # it { should permit(:name, :email, :password, :password_confirmation).for(:create) }
  end

end
