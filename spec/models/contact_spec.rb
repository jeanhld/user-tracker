require 'spec_helper'

describe Contact do
  let(:contact) { FactoryGirl.build :contact }

  describe 'relationships' do
    it { should have_many(:visited_pages) }
  end

  describe 'validations' do
    it { should validate_presence_of :email }

    describe 'email' do
      context 'invalid format' do
        it 'has to be invalid' do
          expect { contact.email = 'invalid.com' }.to change{ contact.valid? }.from(true).to(false)
        end

        it 'has to be invalid' do
          expect { contact.email = 'invalid@mail..com' }.to change{ contact.valid? }.from(true).to(false)
        end

        it 'has to be invalid' do
          expect { contact.email = 'invalid@mail..com.br' }.to change{ contact.valid? }.from(true).to(false)
        end

        it 'has to be invalid' do
          expect { contact.email = 'invalid.123@mail.com..br' }.to change{ contact.valid? }.from(true).to(false)
        end

        it 'has to be invalid' do
          expect { contact.email = 'invalid.123@mail.com.' }.to change{ contact.valid? }.from(true).to(false)
        end

        it 'has to be invalid' do
          expect { contact.email = 'invalid.123@mail.com.br.' }.to change{ contact.valid? }.from(true).to(false)
        end
      end

      context 'valid format' do
        before { contact.email = "invalid.com" }

        it 'has to be valid' do
          expect { contact.email = 'valid@mail.com' }.to change{ contact.valid? }.from(false).to(true)
        end

        it 'has to be valid' do
          expect { contact.email = 'valid123@mail.com' }.to change{ contact.valid? }.from(false).to(true)
        end

        it 'has to be valid' do
          expect { contact.email = 'valid.123@mail.com' }.to change{ contact.valid? }.from(false).to(true)
        end

        it 'has to be valid' do
          expect { contact.email = 'valid.valid@mail.br' }.to change{ contact.valid? }.from(false).to(true)
        end
      end
    end
  end
end
