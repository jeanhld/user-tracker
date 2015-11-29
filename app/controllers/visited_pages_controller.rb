# encoding: utf-8
class VisitedPagesController < ApplicationController
  skip_before_filter :verify_authenticity_token
  prepend_before_filter do
    params[:visited_page] &&= visited_page_params
  end

  def index
    @last_visited_pages = VisitedPage.includes(visitor: :contact).order("accessed_at desc")
    @last_visited_pages = @last_visited_pages.paginate(:page => params[:page], :per_page => 10)
  end

  def create
    @visitor = Visitor.find_or_create_by(identifier: params[:visitor_id])
    @visited_page = VisitedPage.new(visited_page_params)
    @visited_page.visitor = @visitor
    if @visited_page.save
      render status: 201, json: @visited_page
    else
      render status: 422, json: { errors: @visited_page.errors }
    end
  end

  protected
  def visited_page_params
    params.require(:visited_page).permit(:page, :accessed_at)
  end
end
