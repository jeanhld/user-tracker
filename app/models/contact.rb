class Contact < ActiveRecord::Base
  # Associations
  belongs_to :visitor
  has_many :visited_pages, through: :visitor

  # Validations
  validates :email, :presence => true, :uniqueness => true,
    format: { with: /\A[^@\s]+@([^@.\s]+\.)+[^@.\s]+\z/ }
  validates :visitor, :presence => true

  # Methods
  # Returns when the contact visited the last page
  def last_activity
    return nil if self.visited_pages.blank?
    self.visited_pages.order("created_at desc").first.created_at
  end
end
