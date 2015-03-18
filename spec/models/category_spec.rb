require 'rails_helper'

describe Category, type: :model do

  subject { FactoryGirl.build :category }

  context 'validations' do
    it { should validate_presence_of :name }
  end

  context 'associations' do
    it { should have_and_belong_to_many :articles }
  end
end
