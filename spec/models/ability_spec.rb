require 'rails_helper'

describe Ability do

  subject { Ability.new user }

  context 'as guest' do

    let(:user) { nil }

    it { should be_able_to :read, :all }
    it { should be_able_to :search, Article }
    it { should_not be_able_to :manage, Article }
    it { should_not be_able_to :manage, :all }
    it { should_not be_able_to :access, :rails_admin }
    it { should_not be_able_to :dashboard, nil }
  end

  context 'as reader' do

    let(:user) { FactoryGirl.build :user, :reader }

    it { should be_able_to :read, :all }
    it { should be_able_to :search, Article }
    it { should_not be_able_to :manage, Article }
    it { should_not be_able_to :manage, :all }
    it { should_not be_able_to :access, :rails_admin }
    it { should_not be_able_to :dashboard, nil }
  end

  context 'as writer' do

    let(:user) { FactoryGirl.build :user, :writer }

    it { should be_able_to :read, :all }
    it { should be_able_to :search, Article }
    it { should be_able_to :manage, Article }
    it { should_not be_able_to :manage, :all }
    it { should_not be_able_to :access, :rails_admin }
    it { should_not be_able_to :dashboard, nil }
  end

  context 'as admin' do

    let(:user) { FactoryGirl.build :user, :admin }

    it { should be_able_to :read, :all }
    it { should be_able_to :search, Article }
    it { should be_able_to :manage, Article }
    it { should be_able_to :manage, :all }
    it { should be_able_to :access, :rails_admin }
    it { should be_able_to :dashboard, nil }
  end
end
