require 'rails_helper'

describe Page, type: :model do

  subject { FactoryGirl.build :page }

  context 'validations' do
    it { should validate_presence_of :slug }
    it { should validate_presence_of :title }
    it { should validate_presence_of :content }

    it { should validate_uniqueness_of :slug }

    it { should_not allow_value('blog').for(:slug) }
    it { should_not allow_value('admin').for(:slug) }
    it { should_not allow_value('users').for(:slug) }

    it { should allow_value('is-valid-slug').for(:slug) }
    it { should allow_value('33-valid-slug').for(:slug) }
    it { should_not allow_value('Invalid-slug').for(:slug) }
    it { should_not allow_value('!nvalid/slug').for(:slug) }
  end
end
