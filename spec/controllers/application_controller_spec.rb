require 'rails_helper'

RSpec.describe ApplicationController, :type => :controller do

  render_views

  describe '#sitemap' do

    context 'html' do
      before { get :sitemap }

      it { should respond_with 200 }
      it { should render_template :sitemap }
      it { should render_template layout: 'layouts/application' }
    end

    context 'xml' do
      before { get :sitemap, format: :xml }

      it { should respond_with 200 }
      it { should render_template :sitemap }
      it { should_not render_template layout: 'layouts/application' }
    end

    it { should route(:get, '/sitemap').to 'application#sitemap'  }

  end

  describe '#not_found' do

    context 'html' do
      before { get :not_found }

      it { should respond_with 404 }
      it { should render_template 'errors/404' }
      it { should render_template layout: 'layouts/application' }
    end

    context 'json' do
      let(:error_json) { { error: 'Not found!' }.to_json }

      before { get :not_found, format: :json }

      it { should respond_with :missing }
      it { should_not render_template layout: 'layouts/application' }
      it 'should match 404 json' do
        expect(response.body).to eq error_json
      end
    end

    it { should route(:get, '/404').to 'application#not_found'  }
  end

  describe '#internal_server_error' do

    context 'html' do
      before { get :internal_server_error }

      it { should respond_with 500 }
      it { should render_template 'errors/500' }
      it { should render_template layout: 'layouts/application' }
    end

    context 'json' do
      let(:error_json) { { error: 'Internal server error!' }.to_json }

      before { get :internal_server_error, format: :json }

      it { should respond_with 500 }
      it { should_not render_template layout: 'layouts/application' }
      it 'should match 500 json' do
        expect(response.body).to eq error_json
      end
    end

    it { should route(:get, '/500').to 'application#internal_server_error'  }
  end
end
