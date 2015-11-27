class Visitor < ActiveRecord::Base
  # Associations
  has_many :visited_pages
  has_one :contact

  # Validations
  validates :identifier, :presence => true
end
