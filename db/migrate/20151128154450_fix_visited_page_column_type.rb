class FixVisitedPageColumnType < ActiveRecord::Migration
  def change
    change_column :visited_pages, :accessed_at, :datetime
  end
end
