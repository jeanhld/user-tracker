class AddVisitorIdToContacts < ActiveRecord::Migration
  def change
    add_column :contacts, :visitor_id, :integer
  end
end
