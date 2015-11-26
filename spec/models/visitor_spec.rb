require 'spec_helper'

describe Visitor do

  describe 'validations' do
    it { should validate_presence_of :identifier }
  end
end
