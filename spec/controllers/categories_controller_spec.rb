require 'rails_helper'

RSpec.describe CategoriesController, type: :controller do

  describe '#show' do

    before do
      @category = FactoryGirl.create :category
      @articles = FactoryGirl.create_list :article, 20, with_categories: [@category]
    end

    let(:slug) { @category.slug }

    context 'xhr' do
      before { xhr :get, :show, slug: slug }

      it { should respond_with :success }
      it { should render_template :_paginated }

      context '@articles' do

        subject { assigns(:articles) }

        it { should match_array @articles.reverse[0..9] }
      end
    end

    context 'html' do
      before { get :show, slug: slug }

      it { should respond_with :success }
      it { should render_template :show }

      context '@articles' do

        subject { assigns(:articles) }

        it { should match_array @articles.reverse[0..9] }
      end
    end

    it { should route(:get, "/category/#{slug}").to 'categories#show', slug: slug }
  end

end
