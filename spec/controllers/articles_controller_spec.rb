require 'rails_helper'

RSpec.describe ArticlesController, :type => :controller do

  describe '#index' do

    before do
      @articles = FactoryGirl.create_list :article, 10
      get :index
    end

    it { should respond_with :success }
    it { should render_template :index }
    it { should route(:get, '/').to 'articles#index' }
  end

  describe '#search' do

    let(:term) { @articles.first.title }

    before do
      @articles = FactoryGirl.create_list :article, 10
      post :search, search: term
    end

    it { should respond_with :success }
    it { should render_template :index }
    it { should route(:get, "/blog/search/#{term}").to 'articles#search' }
  end

  describe '#show' do

    before do
      @article = FactoryGirl.create :article
      get :show, slug: @article.slug
    end

    it { should respond_with :success }
    it { should render_template :show }
    it { should route(:get, "/blog/#{@article.slug}").to 'articles#show', slug: @article.slug }
  end

  context 'unauthenticated' do

    describe '#new' do

      before { get :new }

      it { should respond_with :redirect }
      it { should redirect_to :root }
    end

    describe '#create' do

      let(:params) { { title: 'Title', slug: 'title', content: '<p>Content</p>' } }

      before { post :create, { article: params }  }

      it { should respond_with :redirect }
      it { should redirect_to :root }

      it 'should not create the article' do
        expect(Article.count).to eq 0
      end
    end

    describe '#edit' do

      before do
        @article = FactoryGirl.create :article
        get :edit, slug: @article.slug
      end

      it { should respond_with :redirect }
      it { should redirect_to :root }
    end

    describe '#update' do

      before do
        @article = FactoryGirl.create :article
        put :update, slug: @article.slug, title: 'vvvvv'
      end

      it { should respond_with :redirect }
      it { should redirect_to :root }

      it 'should not update the article' do
        expect(@article.title).to_not eq 'vvvvv'
      end
    end

    describe '#destroy' do

      before do
        @article = FactoryGirl.create :article
        delete :destroy, slug: @article.slug
      end

      it { should respond_with :redirect }
      it { should redirect_to :root }

      it 'should not destroy the article' do
        expect(Article.count).to eq 1
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
      it { should route(:get, '/blog/new').to 'articles#new' }

      context '@article' do
        subject { assigns :article }

        it { should be_a_new Article }
      end
    end

    describe '#create' do

      context 'with valid params' do

        let(:params) { FactoryGirl.attributes_for :article }

        before { post :create, { article: params } }

        it { should respond_with :redirect }
        it { should redirect_to "/blog/#{params[:slug]}" }

        it 'should associate current user' do
          expect(Article.first.user).to eq @admin
        end

        it 'should create the article' do
          expect(Article.count).to eq 1
        end
      end

      context 'with invalid params' do

        let(:params) { { title: '', slug: '@@@', content: '' } }

        before { post :create, { article: params } }

        it { should respond_with 422 }
        it { should render_template :new }

        it 'should not create the article' do
          expect(Article.count).to eq 0
        end
      end

      it { should route(:post, '/blog').to 'articles#create' }

    end

    describe '#edit' do

      before do
        @article = FactoryGirl.create :article
        get :edit, slug: @article.slug
      end

      it { should respond_with :success }
      it { should render_template :edit }
      it { should route(:get, "/blog/#{@article.slug}/edit").to 'articles#edit', slug: @article.slug }
    end

    describe '#update' do

      before { @article = FactoryGirl.create :article }

      context 'with valid params' do

        let(:params) { { title: 'Updated title', slug: 'updated-title', content: '<p>Updated content</p>' } }

        before { put :update, { slug: @article.slug, article: params } }

        it { should respond_with :redirect }
        it { should redirect_to "/blog/#{params[:slug]}" }

        it 'should change the article' do
          expect(Article.find(@article.id).attributes.with_indifferent_access)
            .to include params
        end
      end

      context 'with invalid params' do

        let(:params) { { title: '', slug: '$$$', content: '' } }

        before { put :update, { slug: @article.slug, article: params } }

        it { should respond_with 422 }
        it { should render_template :edit }

        it 'should not change the article' do
          expect(Article.find(@article.id).attributes.with_indifferent_access)
            .to_not include params
        end
      end

      it { should route(:put, "/blog/#{@article.slug}").to 'articles#update', slug: @article.slug }
    end

    describe '#destroy' do

      before do
        @article = FactoryGirl.create :article
        delete :destroy, slug: @article.slug
      end

      it { should respond_with :redirect }
      it { should redirect_to "/" }

      it 'should destroy the article' do
        expect(Article.count).to eq 0
      end
    end
  end
end
