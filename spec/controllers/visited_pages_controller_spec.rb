require 'spec_helper'

describe VisitedPagesController do
  context '#create' do
    context 'successfully' do
      let(:params) {{ visitor_id: 'uid', visited_page: { page: 'home', accessed_at: DateTime.now }}}

      it 'render 201' do
        post :create, params
        expect(response.status).to eq 201
      end
    end
    context 'failed' do
      let(:params) {{ visitor_id: 'uid', visited_page: { page: nil }}}

      it 'render 422' do
        post :create, params
        expect(response.status).to eq 422
      end
    end
  end
end
