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

  context '#index' do
    let(:visitor) { stub_model(Visitor) }
    let(:contact) { stub_model(Contact, visitor: visitor) }
    let(:visited_page) { stub_model(VisitedPage, visitor: visitor) }

    before do
      VisitedPage.stub_chain(:includes, :order, :paginate) {[visited_page]}
    end

    it 'assigns last_visited_pages' do
      get :index
      expect(assigns :last_visited_pages).to eq [visited_page]
    end
  end
end
