require 'spec_helper'

describe ContactsController do
  let(:visitor) { stub_model(Visitor) }
  let(:contact) { stub_model(Contact, visitor: visitor) }
  let(:visited_page) { stub_model(VisitedPage, visitor: visitor, created_at: DateTime.now-1.day) }
  let(:visited_page2) { stub_model(VisitedPage, visitor: visitor, created_at: DateTime.now) }

  context "#index" do
    before do
      Contact.stub_chain(:all, :order, :paginate) { [contact] }
    end

    it 'assigns contacts' do
      get :index
      expect(assigns :contacts).to eq [contact]
    end
  end

  context '#show' do
    let(:params) {{ visitor_id: 'any-id', id: 'any' }}
    before do
      Contact.stub(:find_by) { contact }
      contact.stub(:visited_pages) { [visited_page, visited_page2] }
      contact.stub(:last_activity) { visited_page2.created_at }
    end

    it 'assigns contact' do
      get :show, params
      expect(assigns :contact).to eq contact
    end

    it 'assigns visited_pages' do
      get :show, params
      expect(assigns :visited_pages).to eq [visited_page, visited_page2]
    end

    it 'assigns last_activity' do
      get :show, params
      expect(assigns :last_activity).to eq visited_page2.created_at
    end
  end

  context '#create' do
    context 'successfully' do
      let(:params) {{ visitor_id: 'uid', contact: { email: 'any@mail.com' }}}

      it 'render 201' do
        post :create, params
        expect(response.status).to eq 201
      end
    end
    context 'failed' do
      let(:params) {{ visitor_id: 'uid', contact: { email: 'invalid.com' }}}

      it 'render 422' do
        post :create, params
        expect(response.status).to eq 422
      end
    end
  end
end
