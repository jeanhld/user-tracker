class AddAccessedAtToVisitedPages < ActiveRecord::Migration
  def change
    add_column :visited_pages, :accessed_at, :date
  end
end
