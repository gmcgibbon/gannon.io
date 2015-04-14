require 'rails_helper'

RSpec.describe CategoriesController, type: :controller do

  describe '#index' do

    subject { lambda { get :index } }

    it { should raise_error ActionController::UrlGenerationError }
  end

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

  context 'unauthenticated' do

    describe '#create' do

      let(:params) { { title: 'Test Cat', slug: 'test-cat' } }

      before { post :create, { category: params }  }

      it { should respond_with :redirect }
      it { should redirect_to :root }

      it 'should not create the category' do
        expect(Category.count).to eq 0
      end

    end

  end

  context 'authenticated' do

    context 'as admin' do

      before :each do
        @admin = FactoryGirl.create :user, :admin
        sign_in @admin
      end

      describe '#create' do

        context 'with valid params' do

          let(:params) { FactoryGirl.attributes_for :category }
          let(:json)   { params.to_json }

          before { post :create, { category: params } }

          it { should respond_with :success }

          it 'should equal expected json' do
            expect(response.body).to eq json
          end

          it 'should create the category' do
            expect(Category.count).to eq 1
          end
        end

        context 'with invalid params' do

          let(:params) { { title: '', slug: '@@@' } }
          let(:json)   { { error: 'Title can\'t be blank and Slug must consist of lowercase and hyphens only' }.to_json }

          before { post :create, { category: params } }

          it { should respond_with 422 }

          it 'should equal expected json' do
            expect(response.body).to eq json
          end

          it 'should not create the category' do
            expect(Category.count).to eq 0
          end
        end

        it { should route(:post, '/category').to 'categories#create' }

      end

    end

  end

end
