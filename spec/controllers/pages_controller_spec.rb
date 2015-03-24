require 'rails_helper'

RSpec.describe PagesController, :type => :controller do

  describe '#index' do

    subject { lambda { get :index } }

    it { should raise_error ActionController::UrlGenerationError }
  end

  describe '#show' do

    before do
      @page = FactoryGirl.create :page
      get :show, slug: @page.slug
    end

    it { should respond_with :success }
    it { should render_template :show }
    it { should route(:get, "/#{@page.slug}").to 'pages#show', slug: @page.slug }
  end

  context 'unauthenticated' do

    describe '#new' do

      before { get :new }

      it { should respond_with :redirect }
      it { should redirect_to :root }
    end

    describe '#create' do

      let(:params) { { title: 'Title', slug: 'title', content: '<p>Content</p>' } }

      before { post :create, { page: params }  }

      it { should respond_with :redirect }
      it { should redirect_to :root }

      it 'should not create the page' do
        expect(Page.count).to eq 0
      end
    end

    describe '#edit' do

      before do
        @page = FactoryGirl.create :page
        get :edit, slug: @page.slug
      end

      it { should respond_with :redirect }
      it { should redirect_to :root }
    end

    describe '#update' do

      before do
        @page = FactoryGirl.create :page
        put :update, slug: @page.slug, title: 'vvvvv'
      end

      it { should respond_with :redirect }
      it { should redirect_to :root }

      it 'should not update the page' do
        expect(@page.title).to_not eq 'vvvvv'
      end
    end

    describe '#destroy' do

      before do
        @page = FactoryGirl.create :page
        delete :destroy, slug: @page.slug
      end

      it { should respond_with :redirect }
      it { should redirect_to :root }

      it 'should not destroy the page' do
        expect(Page.count).to eq 1
      end
    end
  end

  context 'authenticated as admin' do

    before :each do
      @admin = FactoryGirl.create :user, :admin
      sign_in @admin
    end

    describe '#new' do

      before { get :new }

      it { should respond_with :success }
      it { should render_template :new }
      it { should route(:get, '/new').to 'pages#new' }

      context '@page' do
        subject { assigns :page }

        it { should be_a_new Page }
      end
    end

    describe '#create' do

      context 'with valid params' do

        let(:params) { FactoryGirl.attributes_for :page }

        before { post :create, { page: params } }

        it { should respond_with :success }
        it { should render_template :root }

        it 'should create the page' do
          expect(Page.count).to eq 1
        end
      end

      context 'with invalid params' do

        let(:params) { { title: '', slug: '@@@', content: '' } }

        before { post :create, { page: params } }

        it { should respond_with 422 }
        it { should render_template :new }

        it 'should not create the page' do
          expect(Page.count).to eq 0
        end
      end

      it { should route(:post, '/').to 'pages#create' }

    end

    describe '#edit' do

      before do
        @page = FactoryGirl.create :page
        get :edit, slug: @page.slug
      end

      it { should respond_with :success }
      it { should render_template :edit }
      it { should route(:get, "/#{@page.slug}/edit").to 'pages#edit', slug: @page.slug }
    end

    describe '#update' do

      before { @page = FactoryGirl.create :page }

      context 'with valid params' do

        let(:params) { { title: 'Updated title', slug: 'updated-title', content: '<p>Updated content</p>' } }

        before { put :update, { slug: @page.slug, page: params } }

        it { should respond_with :success }
        it { should render_template :show }

        it 'should change the page' do
          expect(Page.find(@page.id).attributes.with_indifferent_access)
            .to include params
        end
      end

      context 'with invalid params' do

        let(:params) { { title: '', slug: '$$$', content: '' } }

        before { put :update, { slug: @page.slug, page: params } }

        it { should respond_with 422 }
        it { should render_template :edit }

        it 'should not change the page' do
          expect(Page.find(@page.id).attributes.with_indifferent_access)
            .to_not include params
        end
      end

      it { should route(:put, "/#{@page.slug}").to 'pages#update', slug: @page.slug }
    end

    describe '#destroy' do

      before do
        @page = FactoryGirl.create :page
        delete :destroy, slug: @page.slug
      end

      it { should respond_with :success }
      it { should render_template :root }

      it 'should destroy the page' do
        expect(Page.count).to eq 0
      end
    end
  end

end
