# encoding: utf-8
class ContactsController < ApplicationController
  def index
    @contacts = Contact.all.order('created_at desc')
    @contacts = @contacts.paginate(:page => params[:page], :per_page => 10)
  end

  def show
    @contact = Contact.find_by(id: params[:id])
  end
end
