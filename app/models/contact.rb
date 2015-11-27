class Contact < ActiveRecord::Base
  # Associations
  has_many :visited_pages, as: :guest

  # Validations
  validates :email, :presence => true, format: { with: /\A[^@\s]+@([^@.\s]+\.)+[^@.\s]+\z/ }
end
