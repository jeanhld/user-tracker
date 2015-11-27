require 'spec_helper'

describe ContactsController do
  let(:params) {{ id: 'any-id' }}
  let(:contact) { stub_model(Contact) }
  let(:visited_page) { stub_model(VisitedPage) }

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
    before do
      Contact.stub(:find_by) { contact }
      contact.stub(:visited_pages) { [visited_page] }
      visited_page.stub(created_at: DateTime.now)
    end

    it 'assigns contact' do
      get :show, params
      expect(assigns :contact).to eq contact
    end

    it 'assigns visited_pages' do
      get :show, params
      expect(assigns :visited_pages).to eq [visited_page]
    end

    it 'assigns last_activity' do
      get :show, params
      expect(assigns :last_activity).to eq visited_page.created_at
    end
  end
end
