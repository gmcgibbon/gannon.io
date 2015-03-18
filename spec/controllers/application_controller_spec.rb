require 'rails_helper'

RSpec.describe ApplicationController, :type => :controller do

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
      let(:error_json) { { error: 'not found!' }.to_json }

      before { get :not_found, format: :json }

      it { should respond_with :missing }
      it 'should match 404 json' do
        expect(response.body).to eq error_json
      end
    end
  end

  describe '#unprocessible_entity' do

    context 'html' do
      before { get :unprocessible_entity }

      it { should respond_with 422 }
      it { should render_template 'errors/422' }
      it { should route(:get, '/422').to 'application#unprocessible_entity'  }
    end

    context 'json' do
      let(:error_json) { { error: 'unprocessible entity!' }.to_json }

      before { get :unprocessible_entity, format: :json }

      it { should respond_with 422 }
      it 'should match 422 json' do
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
      let(:error_json) { { error: 'internal server error!' }.to_json }

      before { get :internal_server_error, format: :json }

      it { should respond_with 500 }
      it 'should match 500 json' do
        expect(response.body).to eq error_json
      end
    end
  end
end
