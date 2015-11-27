class Contact < ActiveRecord::Base
  # Associations
  belongs_to :visitor
  has_many :visited_pages, through: :visitor

  # Validations
  validates :email, :presence => true, :uniqueness => true,
    format: { with: /\A[^@\s]+@([^@.\s]+\.)+[^@.\s]+\z/ }
  validates :visitor, :presence => true
end
