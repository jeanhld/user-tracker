class VisitedPage < ActiveRecord::Base
  # Associations
  enum page: [ :home, :about, :prices, :contact ]
  belongs_to :guest, polymorphic: true

  # Validations
  validates :page, :presence => true
  validate :guest_presence

  private
  def guest_presence
    unless guest
      errors[:guest] << "can't be blank"
      false
    end
  end
end
