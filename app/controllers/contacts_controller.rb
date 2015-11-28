# encoding: utf-8
class ContactsController < ApplicationController
  prepend_before_filter do
    params[:contact] &&= contact_params
  end

  def index
    @contacts = Contact.all.order('created_at desc')
    @contacts = @contacts.paginate(:page => params[:page], :per_page => 10)
  end

  def show
    @contact = Contact.find_by(id: params[:id])
    @visited_pages = @contact.visited_pages
    @last_activity = @contact.last_activity
  end

  def create
    @visitor = Visitor.find_or_create_by(identifier: params[:visitor_id])
    @contact = Contact.new(contact_params)
    @contact.visitor = @visitor
    if @contact.save
      render status: 201, json: @contact
    else
      render status: 422, json: { errors: @contact.errors }
    end
  end

  protected
  def contact_params
    params.require(:contact).permit(:email)
  end
end
