require 'spec_helper'

describe VisitedPage do
  describe 'relationships' do
    it { should belong_to(:guest) }
  end

  describe 'validations' do
    it { should validate_presence_of :page }
    it { should validate_presence_of :guest }
  end
end
