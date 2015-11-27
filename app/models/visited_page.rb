class VisitedPage < ActiveRecord::Base
  # Associations
  belongs_to :visitor
  enum page: [ :home, :about, :prices, :contact ]

  # Validations
  validates :page, :presence => true
  validates :visitor, :presence => true
end
