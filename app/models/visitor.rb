class Visitor < ActiveRecord::Base
  # Associations
  has_many :visited_pages, as: :guest

  # Validations
  validates :identifier, :presence => true
end
