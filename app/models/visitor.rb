class Visitor < ActiveRecord::Base
  validates :identifier, :presence => true
end
