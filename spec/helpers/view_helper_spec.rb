require 'rails_helper'

RSpec.describe ViewHelper, type: :helper do

  describe '#external_controller?' do

    it 'should treat test controller as external' do
      expect(external_controller?).to be true
    end

  end

  describe '#all_categories_by_title' do

    before { FactoryGirl.create_list :category, 15 }

    it 'should have all categories organized by title' do
      expect(all_categories_by_title).to eq Category.all.order('title')
    end
  end

  describe '#all_pages_by_title' do

    before { FactoryGirl.create_list :page, 15 }

    it 'should have all pages organized by title' do
      expect(all_pages_by_title).to eq Page.all.order('title')
    end
  end

end
