class FixVisitedPageColumns < ActiveRecord::Migration
  def change
    remove_column :visited_pages, :guest_type
    rename_column :visited_pages, :guest_id, :visitor_id
  end
end
