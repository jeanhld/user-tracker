class CreateVisitedPages < ActiveRecord::Migration
  def change
    create_table :visited_pages do |t|
      t.integer :page
      t.references :guest, polymorphic: true, index: true

      t.timestamps null: false
    end
  end
end
