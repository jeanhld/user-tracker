class VisitedPage < ActiveRecord::Base
  # Associations
  belongs_to :visitor
  enum page: [ :home, :about, :prices, :contact ]

  # Validations
  validates :page, :accessed_at, :visitor, :presence => true
end
