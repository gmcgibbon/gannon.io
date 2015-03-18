require 'rails_helper'

describe User, type: :model do

  subject { FactoryGirl.build :user }

  context 'validations' do
    it { should validate_presence_of :name } # others are validated by devise
  end

  context 'design' do
    it { should define_enum_for(:role).with([:reader, :writer, :admin]) }
  end

  describe '#initialize' do

    it 'is reader by default' do
      user = described_class.new
      expect(user.role).to eq 'reader'
    end
  end
end
