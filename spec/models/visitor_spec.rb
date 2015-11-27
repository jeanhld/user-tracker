require 'spec_helper'

describe Visitor do

  describe 'relationships' do
    it { should have_many :visited_pages }
  end

  describe 'validations' do
    it { should validate_presence_of :identifier }
  end
end
