require 'rails_helper'

RSpec.describe ApplicationController, :type => :controller do

  render_views

  describe '#root' do

    before do
      @articles = FactoryGirl.create_list :article, 3
      get :root
    end

    it { should respond_with :success }
    it { should render_template :root }
    it { should route(:get, '/').to 'application#root'  }

    context '@articles' do

      subject { assigns(:articles) }

      it { should match_array @articles }
    end
  end

  describe '#not_found' do

    context 'html' do
      before { get :not_found }

      it { should respond_with 404 }
      it { should render_template 'errors/404' }
      it { should route(:get, '/404').to 'application#not_found'  }
    end

    context 'json' do
      let(:error_json) { { error: 'Not found!' }.to_json }

      before { get :not_found, format: :json }

      it { should respond_with :missing }
      it 'should match 404 json' do
        expect(response.body).to eq error_json
      end
    end
  end

  describe '#internal_server_error' do

    context 'html' do
      before { get :internal_server_error }

      it { should respond_with 500 }
      it { should render_template 'errors/500' }
      it { should route(:get, '/500').to 'application#internal_server_error'  }
    end

    context 'json' do
      let(:error_json) { { error: 'Internal server error!' }.to_json }

      before { get :internal_server_error, format: :json }

      it { should respond_with 500 }
      it 'should match 500 json' do
        expect(response.body).to eq error_json
      end
    end
  end
end
